from utils.deobfuscator import deobfuscate_code

code_dir = "data/extracted/code"
obfuscated = deobfuscate_code(code_dir)

print(f"\nObfuscated Lines Found: {len(obfuscated)}")
for f, line in obfuscated[:15]:
    print(f"{f}: {line}")
