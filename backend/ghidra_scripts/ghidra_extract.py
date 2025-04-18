# -*- coding: utf-8 -*-
#@author
#@category MalwareAnalysis
#@keybinding
#@menupath
#@toolbar

import json
import os

output = {
    "strings": [],
    "functions": []
}

# Get listing and function manager from currentProgram
listing = currentProgram.getListing()
function_manager = currentProgram.getFunctionManager()

# Extract strings
strings = listing.getDefinedData(True)
for item in strings:
    try:
        if str(item.getDataType()) == "string":
            value = item.getValue()
            if value and len(str(value)) >= 4:
                output["strings"].append(str(value))
    except:
        continue

# Extract function names
for func in function_manager.getFunctions(True):
    output["functions"].append(func.getName())

# Save to JSON
out_file = "C:\\Users\\user\\OneDrive\\Desktop\\ReverseAI-MalwareTool\\backend\\data\\ghidra_output.json"
try:
    with open(out_file, "w") as f:
        json.dump(output, f, indent=2)
    print("[✓] Ghidra JSON Export Done:", out_file)
except Exception as e:
    print("[!] Failed to write JSON:", str(e))
