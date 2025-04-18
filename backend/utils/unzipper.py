import zipfile

def analyze_apk_structure(apk_path):
    findings = {
        "has_sh": False,
        "has_native_libs": False,
        "has_packed_assets": False,
        "shell_scripts": [],
        "native_libs": [],
        "packed_assets": []
    }

    if not zipfile.is_zipfile(apk_path):
        return findings

    with zipfile.ZipFile(apk_path, 'r') as apk:
        for file in apk.namelist():
            lower = file.lower()

            if lower.endswith(".sh"):
                findings["has_sh"] = True
                findings["shell_scripts"].append(file)

            if lower.endswith(".so") or lower.endswith(".bin") or "/lib/" in lower:
                findings["has_native_libs"] = True
                findings["native_libs"].append(file)

            if "assets" in lower and (".enc" in lower or ".dat" in lower or ".pack" in lower):
                findings["has_packed_assets"] = True
                findings["packed_assets"].append(file)

    return findings
