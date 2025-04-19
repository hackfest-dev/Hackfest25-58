import subprocess
import os
import shutil
import tempfile

def run_radare2(so_path):
    try:
        # Normalize paths
        so_path = os.path.normpath(so_path).replace("\\", "/")

        # Try to locate r2.exe (not r2.BAT!)
        r2_binary = shutil.which("radare2") or r"C:\Tools\radare2\radare2-5.9.8-w64\bin\radare2.exe"


        if not os.path.exists(r2_binary):
            return {
                "status": "error",
                "error": f"Radare2 binary not found at: {r2_binary}"
            }

        # Create a temporary script file to feed to Radare2
        with tempfile.NamedTemporaryFile(mode="w+", delete=False, suffix=".r2") as script:
            script.write("aaa\n")
            script.write("pd 30\n")
            script_path = script.name.replace("\\", "/")

        # Build the command explicitly with r2.exe (avoid r2.BAT)
        cmd = [r2_binary, "-i", script_path, so_path]
        print(f"[r2] Running: {' '.join(cmd)}")

        # Set environment for subprocess
        env = os.environ.copy()
        r2_dir = os.path.dirname(r2_binary)
        env["PATH"] = r2_dir + os.pathsep + env.get("PATH", "")

        # Run Radare2 and capture output
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=60, env=env)

        # Clean up temp file
        os.remove(script_path)

        if result.returncode == 0:
            lines = result.stdout.strip().splitlines()
            instructions = [line for line in lines if line.strip()]
            return {
                "status": "success",
                "instruction_count": len(instructions),
                "instructions": instructions[:30]
            }
        else:
            return {
                "status": "error",
                "error": result.stderr.strip() or "Radare2 returned non-zero exit code."
            }

    except subprocess.TimeoutExpired:
        return {
            "status": "error",
            "error": "Radare2 timed out. Try smaller files or increase timeout."
        }

    except Exception as e:
        return {
            "status": "error",
            "error": f"Unexpected error: {str(e)}"
        }
