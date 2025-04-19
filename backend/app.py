# backend/app.py

from flask import Flask, request, jsonify
from flask_cors import CORS
import os, shutil, time
from utils.codebert_classifier import classify_method_code
from utils.extract_methods import extract_java_methods
from utils.feature_extractor import unpack_apk, decompile_java, extract_permissions, list_api_calls
from utils.deobfuscator import deobfuscate_code
from utils.unzipper import analyze_apk_structure
from utils.ghidra_runner import analyze_so_with_ghidra
from utils.asm_inspector import run_radare2
from models.malware_classifier import predict
from utils.threat_classifier import classify_threats

app = Flask(__name__)
CORS(app)

UPLOAD_PATH = "data/apks/input.apk"
APKTOOL_OUT = "data/extracted/unpacked"
JADX_OUT = "data/extracted/code"

def safe_delete(path, retries=3):
    for i in range(retries):
        try:
            if os.path.exists(path):
                shutil.rmtree(path)
            return
        except Exception as e:
            print(f"[!] Retry delete {path} ({i+1}/{retries}): {e}")
            time.sleep(2)

@app.route('/scan', methods=['POST'])
def scan_apk():
    file = request.files.get("apk")
    if not file:
        return jsonify({"error": "No APK uploaded"}), 400

    os.makedirs("data/apks", exist_ok=True)
    file.save(UPLOAD_PATH)

    try:
        structure = analyze_apk_structure(UPLOAD_PATH)
        safe_delete(APKTOOL_OUT)
        safe_delete(JADX_OUT)

        unpack_apk(UPLOAD_PATH, APKTOOL_OUT)
        decompile_java(UPLOAD_PATH, JADX_OUT)

        permissions = extract_permissions(os.path.join(APKTOOL_OUT, "AndroidManifest.xml"))
        api_calls = list_api_calls(JADX_OUT)
        obfuscated = deobfuscate_code(JADX_OUT)
        suspicious_assets = structure["shell_scripts"] + structure["native_libs"] + structure["packed_assets"]

        features = [len(permissions), len(api_calls), len(obfuscated)]
        is_malicious = bool(predict(features) == 1)

        ghidra_data = {}
        asm_data = {}
        for root, _, files in os.walk(os.path.join(APKTOOL_OUT, "lib")):
            for f in files:
                if f.endswith(".so"):
                    so_path = os.path.join(root, f)
                    print(f"[+] Running Ghidra on: {so_path}")
                    ghidra_data = analyze_so_with_ghidra(so_path)

                    print(f"[+] Running Radare2 on: {so_path}")
                    asm_data = run_radare2(so_path)
                    break

        java_methods = extract_java_methods(JADX_OUT)
        classified_methods = [
            {"type": classify_method_code(method), "code": method[:500]}
            for method in java_methods[:20]
        ] if java_methods else []

        threats = classify_threats(permissions, api_calls, len(obfuscated), suspicious_assets)

        return jsonify({
            "malicious": is_malicious,
            "permissions_count": len(permissions),
            "permissions": permissions[:10],
            "api_calls_count": len(api_calls),
            "sample_api_calls": api_calls[:10],
            "obfuscation_count": len(obfuscated),
            "obfuscation_type": "Shell script (.sh) detected" if structure["has_sh"] else "None",
            "native_code": bool(structure["has_native_libs"]),
            "asset_packing": bool(structure["has_packed_assets"]),
            "suspicious_assets": suspicious_assets,
            "native_analysis": ghidra_data,
            "assembly_inspection": asm_data or {"status": "not available"},
            "codebert_analysis": classified_methods,
            "threats": threats
        })

    except Exception as e:
        import traceback
        traceback.print_exc()
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(port=5000)
