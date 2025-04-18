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
    if any("input/event" in call.lower() for call in api_calls):
        add_threat(
            "KEYLOGGER_BEHAVIOR", "HIGH",
            "Reads input via /dev/input/event",
            "Remove keylogging behavior or use secure input APIs"
        )

    # 🚨 Suspicious Network Access
    if any("192.168." in call or "http://" in call.lower() for call in api_calls):
        add_threat(
            "SUSPICIOUS_NETWORK_ACCESS", "HIGH",
            "Accesses internal IP or uses unsecured HTTP",
            "Use secure HTTPS and monitor external connections"
        )

    # 🔥 Dynamic Code Execution
    if any("getMethod" in call or "invoke" in call for call in api_calls):
        add_threat(
            "DYNAMIC_CODE_LOADING", "HIGH",
            "Loads code dynamically using reflection",
            "Avoid reflection on sensitive methods"
        )

    # 🔐 Obfuscation Detected
    if isinstance(obfuscation_count, int) and obfuscation_count > 1000:
        add_threat(
            "OBFUSCATED_FUNCTIONS", "MEDIUM",
            f"{obfuscation_count} obfuscated code lines detected",
            "Check for packing, encryption or multi-stage loaders"
        )

    # 🧬 Native Libraries (.so)
    if any(".so" in asset.lower() for asset in suspicious_assets):
        add_threat(
            "NATIVE_BINARY_FOUND", "MEDIUM",
            "Contains native binaries (.so)",
            "Disassemble using Ghidra or Radare2"
        )

    # ⚠️ Shell Scripts
    if any(asset.lower().endswith(".sh") for asset in suspicious_assets):
        add_threat(
            "SHELL_SCRIPT_FOUND", "MEDIUM",
            "Shell scripts found inside APK",
            "Possible command execution or obfuscation loader"
        )

    return threats
