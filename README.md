📁 Project Structure
ReverseAI-MalwareTool/
├── backend/
│   ├── app.py                     # Main Flask server
│   ├── models/
│   │   └── malware_classifier.py  # ML model for predicting malware
│   ├── utils/
│   │   ├── asm_inspector.py       # Uses Radare2 for assembly inspection
│   │   ├── deobfuscator.py        # Detects obfuscated code
│   │   ├── extract_methods.py     # Extracts Java methods
│   │   ├── feature_extractor.py   # Permissions, API calls, unpacking, JADX
│   │   ├── ghidra_runner.py       # Runs Ghidra Headless analysis
│   │   ├── threat_classifier.py   # Final verdict: malicious or not
│   │   └── unzipper.py            # APK structure analyzer
│   ├── ghidra_scripts/
│   │   └── ghidra_extract.py      # Script executed by Ghidra
│   └── data/
│       └── (APK input/output folders)
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   └── ThreatReport.jsx   # Component to render analysis results
│   │   ├── App.jsx                # File upload + scan trigger
│   │   └── index.js               # React DOM rendering
├── README.md                      # You are here
└── requirements.txt               # Python dependencies


⚙️ Installation & Setup Guide

✅ Prerequisites
You need the following installed on your system:


Tool	Version Recommended
Python	3.10+
Node.js + npm	16.x or 18.x
Apktool	2.9+
JADX	1.4+ (CLI)
Ghidra	11+ (headless support)
Radare2	5.9+
Java	JDK 17 or 21
🔧 Backend Setup
Clone the repo:

bash
Copy
Edit
git clone https://github.com/your-org/ReverseAI-MalwareTool.git
cd ReverseAI-MalwareTool/backend
Create a virtual environment:

bash
Copy
Edit
python -m venv venv
venv\Scripts\activate     # on Windows
Install dependencies:

bash
Copy
Edit
pip install -r requirements.txt
Ensure tools are on PATH:

Add these to your environment variables:

makefile
Copy
Edit
C:\Windows\Apktool\
C:\jadx\bin\
C:\Tools\radare2\radare2-5.9.8-w64\bin
Run backend server:

bash
Copy
Edit
python app.py
🌐 Frontend Setup
Open a new terminal:

bash
Copy
Edit
cd ../frontend
npm install
npm start
React dev server runs at http://localhost:3000

🚀 How It Works
➤ Step-by-Step Flow
Upload APK from frontend.

Flask receives the file → saves it.

Extracts contents using:

apktool (manifest + smali)

jadx (Java source)

Runs:

Permissions & API extraction

Obfuscation check

Native .so scanning via:

🧬 Ghidra (headless)

🔬 Radare2 (assembly inspection)

Java methods classified using CodeBERT.

Final prediction using a trained RandomForestClassifier.

Result JSON sent back to frontend.

Frontend renders a beautiful report.

🧠 Technologies Used

Feature	            Tool
APK unpacking	    Apktool
Java decompilation	JADX
Native code reverse	Ghidra
Assembly inspection	Radare2
Code classification	CodeBERT
Threat classification	RandomForest
Frontend UI	React
Backend API	Flask
📂 Important Files (Backend)

File	            Role
app.py	        Main backend logic
utils/feature_extractor.py	Extracts APIs,      permissions, decompiles code
utils/asm_inspector.py	Runs Radare2 on .so files
utils/ghidra_runner.py	Automates Ghidra headless execution
utils/codebert_classifier.py	Uses HuggingFace model to classify methods
utils/threat_classifier.py	Combines all signals to determine threat
ghidra_scripts/ghidra_extract.py	Custom Ghidra Python logic
models/malware_classifier.py	Our trained scikit-learn model
✅ Final Tips for Teammates
Make sure tools run in command line (like apktool d test.apk)

Use a real APK to test — fake/test ones may not have .so files.

If something fails, check:

Output in terminal

data/ folder

print() logs in app.py