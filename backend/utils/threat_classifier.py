def classify_threats(permissions, api_calls, obfuscation_count, suspicious_assets):
    threats = []

    def add_threat(threat_id, risk, description, suggestion):
        threats.append({
            "id": threat_id,
            "risk": risk,
            "description": description,
            "ai_suggestion": suggestion
        })

    # 🚨 Keylogger Behavior
    keylogger_apis = ["input/event", "getevent", "accessibilityservice"]
    if any(any(needle in call.lower() for needle in keylogger_apis) for call in api_calls):
        add_threat(
            "KEYLOGGER_BEHAVIOR", "HIGH",
            "Potential keylogger detected: accesses input event APIs or system accessibility.",
            "Avoid monitoring raw input events unless strictly necessary."
        )

    # 🚨 Suspicious Network Access
    if any("192.168." in call or "http://" in call.lower() for call in api_calls):
        add_threat(
            "SUSPICIOUS_NETWORK_ACCESS", "HIGH",
            "Unsecured or private network access via internal IPs or HTTP.",
            "Ensure all network traffic uses secure HTTPS and avoid hardcoded IPs."
        )

    # 🔥 Dynamic Code Execution
    dynamic_calls = ["getMethod", "invoke", "loadClass", "Class.forName", "Method.invoke"]
    if any(any(dc in call for dc in dynamic_calls) for call in api_calls):
        add_threat(
            "DYNAMIC_CODE_LOADING", "HIGH",
            "Uses reflection or dynamic loading to execute code at runtime.",
            "Restrict reflection on sensitive operations and avoid dynamic loading of unknown code."
        )

    # 🧬 Native Libraries
    if any(".so" in asset.lower() for asset in suspicious_assets):
        add_threat(
            "NATIVE_BINARY_FOUND", "MEDIUM",
            "Includes native libraries (.so files), often used to hide malicious behavior.",
            "Run deeper binary analysis (Ghidra, Radare2) on these binaries."
        )

    # ⚠️ Shell Scripts or Executable Assets
    if any(asset.lower().endswith(('.sh', '.py', '.dex', '.jar')) for asset in suspicious_assets):
        add_threat(
            "SUSPICIOUS_EXECUTABLE_ASSETS", "MEDIUM",
            "Script or executable files found inside the APK assets.",
            "Check for obfuscation loaders or dropper behavior."
        )

    # 🕵️ Obfuscation Detected
    if isinstance(obfuscation_count, int) and obfuscation_count > 200:
        level = "HIGH" if obfuscation_count > 1000 else "MEDIUM"
        add_threat(
            "OBFUSCATION_DETECTED", level,
            f"{obfuscation_count} suspicious or unreadable method names detected.",
            "Consider reversing with JADX or using deobfuscation tools to inspect logic."
        )

    # 🧪 Excessive Permissions
    dangerous_permissions = [p for p in permissions if "READ_SMS" in p or "WRITE_SETTINGS" in p or "RECORD_AUDIO" in p]
    if len(dangerous_permissions) >= 2:
        add_threat(
            "DANGEROUS_PERMISSIONS", "MEDIUM",
            f"Excessive permissions like {', '.join(dangerous_permissions)}",
            "Review permission usage and ensure they are required for app functionality."
        )

    return threats
