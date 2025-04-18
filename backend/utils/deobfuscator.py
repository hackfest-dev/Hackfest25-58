import os
import re

def detect_obfuscation(code_line):
    """
    Returns True if a line looks like it uses obfuscated variable/method names
    """
    return bool(re.match(r'^\s*[a-zA-Z_$]{1,3}\s*=\s*.*;', code_line.strip()))

def deobfuscate_code(code_dir):
    """
    Walks through Java files and flags obfuscated lines
    """
    print("[+] Scanning for obfuscation...")
    suspicious_lines = []

    for root, _, files in os.walk(code_dir):
        for file in files:
            if file.endswith(".java"):
                path = os.path.join(root, file)
                try:
                    with open(path, encoding="utf-8", errors="ignore") as f:
                        for line in f:
                            if detect_obfuscation(line):
                                suspicious_lines.append((file, line.strip()))
                except Exception as e:
                    print(f"[!] Could not read {file}: {e}")
    return suspicious_lines
