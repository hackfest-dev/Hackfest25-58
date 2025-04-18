import subprocess
import json
import os

# Absolute path to Ghidra's headless script
GHIDRA_PATH = r"C:\Tools\ghidra\ghidra_11.3.2_PUBLIC\support\analyzeHeadless.bat"

# Automatically resolve ghidra_extract.py path relative to this file
GHIDRA_SCRIPT = os.path.abspath(os.path.join(
    os.path.dirname(__file__), "..", "ghidra_scripts", "ghidra_extract.py"))

# Output file location for Ghidra analysis results
GHIDRA_OUTPUT = os.path.abspath(os.path.join(
    os.path.dirname(__file__), "..", "data", "ghidra_output.json"))

def analyze_so_with_ghidra(so_path):
    try:
        print(f"[+] Running Ghidra on: {so_path}")
        print(f"[+] Using script: {GHIDRA_SCRIPT}")
        print(f"[+] Output will be at: {GHIDRA_OUTPUT}")

        subprocess.run([
            GHIDRA_PATH,
            ".", "ghidra_project",
            "-import", os.path.abspath(so_path),
            "-postScript", GHIDRA_SCRIPT,
            "-deleteProject"
        ], check=True)

        if os.path.exists(GHIDRA_OUTPUT):
            with open(GHIDRA_OUTPUT, "r") as f:
                return json.load(f)

        print("[!] Ghidra completed but no output file was found.")

    except subprocess.CalledProcessError as e:
        print(f"[!] Ghidra subprocess failed: {e}")
    except Exception as e:
        print(f"[!] Ghidra analysis error: {e}")

    return {
        "functions": [],
        "strings": [],
        "error": "Ghidra run failed or no output"
    }
