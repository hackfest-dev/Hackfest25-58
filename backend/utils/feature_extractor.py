import os
import shutil
import subprocess
import xml.etree.ElementTree as ET

# ✅ Set absolute paths to your local tools
APKTOOL_PATH = r"C:\Windows\Apktool\apktool.bat"
JADX_PATH = r"C:\jadx\bin\jadx.bat"


def unpack_apk(apk_path, output_dir):
    """
    Uses apktool to unpack APK and extract manifest + smali code.
    """
    apk_path = os.path.abspath(apk_path)
    output_dir = os.path.abspath(output_dir)

    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    cmd = [APKTOOL_PATH, 'd', '-f', apk_path, '-o', output_dir]
    print(f"[+] Unpacking APK with apktool...\n    {' '.join(cmd)}")
    try:
        subprocess.run(cmd, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        print("[✓] APK unpacked successfully.")
    except FileNotFoundError:
        raise RuntimeError(f"[✗] apktool not found at: {APKTOOL_PATH}")
    except subprocess.CalledProcessError as e:
        raise RuntimeError(f"[✗] apktool failed to unpack the APK:\n{e}")


def decompile_java(apk_path, output_dir):
    """
    Uses JADX to decompile APK and extract readable Java code.
    """
    apk_path = os.path.abspath(apk_path)
    output_dir = os.path.abspath(output_dir)

    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir, exist_ok=True)

    cmd = [JADX_PATH, '-d', output_dir, apk_path]
    print(f"[+] Decompiling APK with JADX...\n    {' '.join(cmd)}")
    try:
        subprocess.run(cmd, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        print("[✓] APK decompiled successfully.")
    except FileNotFoundError:
        print(f"[✗] jadx not found at: {JADX_PATH}")
    except subprocess.CalledProcessError as e:
        print(f"[✗] JADX decompilation failed:\n{e}")
        print("[!] Continuing without Java code.")


def extract_permissions(manifest_path):
    """
    Extracts permissions from AndroidManifest.xml
    """
    print("[+] Extracting permissions from manifest...")
    permissions = []
    try:
        tree = ET.parse(manifest_path)
        root = tree.getroot()
        for elem in root.findall(".//uses-permission"):
            name = elem.attrib.get('{http://schemas.android.com/apk/res/android}name')
            if name:
                permissions.append(name)
        print(f"[✓] Found {len(permissions)} permissions.")
    except Exception as e:
        print("[!] Failed to parse manifest:", e)
    return permissions


def list_api_calls(code_dir):
    """
    Scans .java files for suspicious API calls
    """
    print("[+] Scanning Java code for API calls...")
    apis = []
    suspicious_keywords = ["http", "socket", "File", "exec", "Runtime", "ProcessBuilder"]

    for root, _, files in os.walk(code_dir):
        for file in files:
            if file.endswith(".java"):
                path = os.path.join(root, file)
                try:
                    with open(path, encoding="utf-8", errors="ignore") as f:
                        for line in f:
                            if any(keyword in line for keyword in suspicious_keywords):
                                apis.append(line.strip())
                except Exception as e:
                    print(f"[!] Failed to read {file}: {e}")

    print(f"[✓] Found {len(apis)} suspicious API calls.")
    return apis
