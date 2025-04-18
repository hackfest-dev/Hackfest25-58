import os
import csv
import shutil
from utils.feature_extractor import extract_permissions, list_api_calls
from utils.deobfuscator import deobfuscate_code

APKTOOL_OUT = "data/extracted/unpacked"
JADX_OUT = "data/extracted/code"
DATASET_CSV = "data/dataset.csv"

def extract_features(apk_path):
    """
    Extracts features from an APK:
    - Number of permissions
    - Number of suspicious API calls
    - Number of obfuscated lines
    """
    from utils.feature_extractor import unpack_apk, decompile_java

    try:
        # Cleanup
        if os.path.exists(APKTOOL_OUT):
            shutil.rmtree(APKTOOL_OUT)
        if os.path.exists(JADX_OUT):
            shutil.rmtree(JADX_OUT)

        unpack_apk(apk_path, APKTOOL_OUT)
        decompile_java(apk_path, JADX_OUT)

        perms = extract_permissions(os.path.join(APKTOOL_OUT, "AndroidManifest.xml"))
        apis = list_api_calls(JADX_OUT)
        obfs = deobfuscate_code(JADX_OUT)

        return [len(perms), len(apis), len(obfs)]

    except Exception as e:
        print(f"[!] Skipping {apk_path}: {e}")
        return None


def build_dataset():
    rows = []
    rows.append(["permissions", "api_calls", "obfuscation_count", "label"])

    for label_folder, label in [("benign", 0), ("malware", 1)]:
        folder = f"data/{label_folder}"
        for filename in os.listdir(folder):
            if filename.endswith(".apk"):
                print(f"[+] Processing: {filename}")
                try:
                    path = os.path.join(folder, filename)
                    feats = extract_features(path)
                    if feats is not None:
                        feats.append(label)
                        rows.append(feats)
                except Exception as e:
                    print(f"[!] Failed on {filename}: {e}")

    with open(DATASET_CSV, "w", newline='') as f:
        writer = csv.writer(f)
        writer.writerows(rows)
    print(f"[✓] Dataset saved to {DATASET_CSV}")


if __name__ == "__main__":
    build_dataset()
