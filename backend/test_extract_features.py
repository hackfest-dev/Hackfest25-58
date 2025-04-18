from utils.feature_extractor import extract_permissions, list_api_calls

manifest = "data/extracted/unpacked/AndroidManifest.xml"
code_dir = "data/extracted/code/"

perms = extract_permissions(manifest)
print(f"\nPermissions Found ({len(perms)}):")
for p in perms:
    print(f" - {p}")

apis = list_api_calls(code_dir)
print(f"\nSuspicious API Calls Found ({len(apis)}):")
for a in apis[:15]:  # just show top 15
    print(f" - {a}")
