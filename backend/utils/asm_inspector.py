import subprocess
import os

def run_radare2(so_path):
    try:
        # Normalize Windows paths and make them forward slashes for Radare2
        so_path = os.path.normpath(so_path).replace("\\", "/")

        # Construct command to run Radare2
        cmd = ["r2", "-A", "-c", "aaa; pd 30", so_path]
        print(f"[r2] Running: {' '.join(cmd)}")

        # Ensure Radare2 binary path is included explicitly
        env = os.environ.copy()
        r2_path = r"C:\Tools\radare2\radare2-5.9.8-w64\bin"
        if r2_path not in env["PATH"]:
            env["PATH"] = r2_path + ";" + env["PATH"]

        # Run the command
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=60, env=env)

        if result.returncode == 0:
            # Clean and parse output
            lines = result.stdout.strip().splitlines()
            instructions = [line for line in lines if line.strip()]

            return {
                "status": "ok",
                "instruction_count": len(instructions),
                "sample": instructions[:30]
            }

        return {
            "status": "error",
            "error": result.stderr.strip() or "Radare2 returned non-zero exit."
        }

    except FileNotFoundError:
        return {
            "status": "error",
            "error": "Radare2 not found. Make sure 'r2' is in your system PATH."
        }

    except subprocess.TimeoutExpired:
        return {
            "status": "error",
            "error": "Radare2 execution timed out."
        }

    except Exception as e:
        return {
            "status": "error",
            "error": f"Unexpected error: {str(e)}"
        }
