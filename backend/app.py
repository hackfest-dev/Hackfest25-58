from flask import Flask, request, jsonify
from flask_cors import CORS
import os
import shutil
import time

# 🧠 AI Code Classification
from utils.codebert_classifier import classify_method_code
from utils.extract_methods import extract_java_methods

# 🔍 Analysis Modules
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
        # 📦 Step 1: Analyze APK structure
        structure = analyze_apk_structure(UPLOAD_PATH)

        # 🧹 Step 2: Cleanup old runs
        safe_delete(APKTOOL_OUT)
        safe_delete(JADX_OUT)

        # 🔍 Step 3: Reverse Engineering
        unpack_apk(UPLOAD_PATH, APKTOOL_OUT)
        decompile_java(UPLOAD_PATH, JADX_OUT)

        # 🧠 Step 4: Static Feature Extraction
        permissions = extract_permissions(os.path.join(APKTOOL_OUT, "AndroidManifest.xml"))
        api_calls = list_api_calls(JADX_OUT)
        obfuscated = deobfuscate_code(JADX_OUT)

        features = [len(permissions), len(api_calls), len(obfuscated)]
        result = predict(features)

        # 🔬 Step 5: Native Code Analysis (Ghidra + Radare2)
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
                    break  # Only analyze the first .so

        # 🧠 Step 6: AI CodeBERT-based method classification
        java_methods = extract_java_methods(JADX_OUT)
        classified_methods = [
            {"type": classify_method_code(method), "code": method[:500]}
            for method in java_methods[:20]
        ]

        # 🛡️ Step 7: Threat Classification
        threats = classify_threats(api_calls, permissions, obfuscated, structure)

        return jsonify({
            "malicious": bool(result),
            "permissions_count": len(permissions),
            "api_calls_count": len(api_calls),
            "obfuscation_count": len(obfuscated),
            "permissions": permissions[:10],
            "sample_api_calls": api_calls[:10],
            "obfuscation_type": "Shell script (.sh) detected" if structure["has_sh"] else "None",
            "native_code": structure["has_native_libs"],
            "asset_packing": structure["has_packed_assets"],
            "suspicious_assets": structure["shell_scripts"] + structure["native_libs"] + structure["packed_assets"],
            "native_analysis": ghidra_data,
            "assembly_inspection": asm_data or {"status": "not available"},            "threats": threats,
            "codebert_analysis": classified_methods
        })
    except Exception as e:
        import traceback
        traceback.print_exc()  # 👈 shows the full error in the console
        return jsonify({"error": str(e)}), 500
    

    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(port=5000)
