# utils/extract_methods.py

import os
import re

def extract_java_methods(code_dir):
    methods = []
    pattern = re.compile(r"(public|private|protected)?\s+\w+\s+\w+\s*\(.*?\)\s*\{", re.MULTILINE)

    for root, _, files in os.walk(code_dir):
        for file in files:
            if file.endswith(".java"):
                path = os.path.join(root, file)
                try:
                    with open(path, "r", encoding="utf-8", errors="ignore") as f:
                        content = f.read()
                        for match in pattern.finditer(content):
                            start = match.start()
                            block = extract_method_block(content, start)
                            if block:
                                methods.append(block)
                except Exception as e:
                    print(f"[!] Failed to read method from {path}: {e}")
    return methods

def extract_method_block(content, start_idx):
    brace_count = 0
    method = ""
    for i in range(start_idx, len(content)):
        char = content[i]
        method += char
        if char == "{":
            brace_count += 1
        elif char == "}":
            brace_count -= 1
            if brace_count == 0:
                break
    return method if len(method) > 20 else None
