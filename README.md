# 🛡️ ReverseAI - Malware Analysis Tool

A complete AI-powered reverse engineering and malware analysis platform for Android APKs. It supports both static and native code analysis using **Ghidra**, **Radare2**, **CodeBERT**, and custom ML models.

---

## 📁 Project Structure

```
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
```

---

## ⚙️ Installation & Setup Guide

### ✅ Prerequisites

You need the following installed **on your system**:

| Tool         | Version Recommended      |
|--------------|---------------------------|
| Python       | 3.10+                     |
| Node.js + npm| 16.x or 18.x              |
| Apktool      | 2.9+                      |
| JADX         | 1.4+ (CLI)                |
| Ghidra       | 11+ (headless support)    |
| Radare2      | 5.9+                      |
| Java         | JDK 17 or 21              |

---

### 🔧 Backend Setup

1. **Clone the repo**:
   ```bash
   git clone https://github.com/your-org/ReverseAI-MalwareTool.git
   cd ReverseAI-MalwareTool/backend
   ```

2. **Create a virtual environment**:
   ```bash
   python -m venv venv
   venv\Scripts\activate     # on Windows
   ```

3. **Install dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

4. **Ensure tools are on PATH**:
   - Add these to your environment variables:
     ```
     C:\Windows\Apktool\
     C:\jadx\bin\
     C:\Tools\radare2\radare2-5.9.8-w64\bin
     ```

5. **Run backend server**:
   ```bash
   python app.py
   ```

---

### 🌐 Frontend Setup

1. Open a new terminal:
   ```bash
   cd ../frontend
   npm install
   npm start
   ```

2. React dev server runs at [http://localhost:3000](http://localhost:3000)

---

## 🚀 How It Works

### ➤ Step-by-Step Flow

1. **Upload APK** from frontend.
2. Flask receives the file → saves it.
3. Extracts contents using:
   - `apktool` (manifest + smali)
   - `jadx` (Java source)
4. Runs:
   - Permissions & API extraction
   - Obfuscation check
   - Native `.so` scanning via:
     - 🧬 **Ghidra** (headless)
     - 🔬 **Radare2** (assembly inspection)
5. Java methods classified using **CodeBERT**.
6. Final prediction using a trained **RandomForestClassifier**.
7. Result JSON sent back to frontend.
8. Frontend renders a beautiful report.

---

## 🧠 Technologies Used

| Feature                 | Tool |
|------------------------|------|
| APK unpacking          | Apktool |
| Java decompilation     | JADX |
| Native code reverse    | Ghidra |
| Assembly inspection    | Radare2 |
| Code classification    | CodeBERT |
| Threat classification  | RandomForest |
| Frontend UI            | React |
| Backend API            | Flask |

---

## 📂 Important Files (Backend)

| File | Role |
|------|------|
| `app.py` | Main backend logic |
| `utils/feature_extractor.py` | Extracts APIs, permissions, decompiles code |
| `utils/asm_inspector.py` | Runs Radare2 on `.so` files |
| `utils/ghidra_runner.py` | Automates Ghidra headless execution |
| `utils/codebert_classifier.py` | Uses HuggingFace model to classify methods |
| `utils/threat_classifier.py` | Combines all signals to determine threat |
| `ghidra_scripts/ghidra_extract.py` | Custom Ghidra Python logic |
| `models/malware_classifier.py` | Our trained scikit-learn model |

---

## ✅ Final Tips for Teammates

- Make sure **tools run in command line** (like `apktool d test.apk`)
- Use a real APK to test — fake/test ones may not have `.so` files.
- If something fails, check:
  - Output in terminal
  - `data/` folder
  - `print()` logs in `app.py`



REPEAT-------------------------------------------------MORE INFO


# 🛡️ ReverseAI - Android Malware Analysis Tool

ReverseAI is a powerful **automated reverse engineering and malware analysis platform** for Android apps (APKs). Designed for hackathons and real-world use, it uses **AI + static analysis + reverse engineering** to detect and classify malicious behavior — even in obfuscated apps with native libraries.

---

## 🚀 Features

- ✅ Upload and analyze any `.apk` via a simple web interface
- 📦 Reverse engineering using `apktool`, `jadx`, `Ghidra`, and `Radare2`
- 🔍 Detect:
  - Dangerous permissions
  - Suspicious API calls
  - Native `.so` libraries
  - Obfuscation and asset packing
- 🤖 AI threat classification using:
  - `RandomForestClassifier` on feature vectors
  - `CodeBERT` on decompiled Java methods
- 📊 Generate full threat reports in one click

---

## 📂 Project Structure (What each file does)

```
ReverseAI-MalwareTool/
├── app.py                        # 🧠 Main Flask backend (API logic & pipeline)
├── train_model.py               # 🔬 (Optional) Used to train the RandomForest model from dataset.csv
├── build_dataset.py            # 🔧 Script to build dataset from benign/malware samples
├── test_*.py                   # ✅ Test scripts for extractors & features

├── data/                       # 📁 Data I/O
│   ├── apks/                   # Uploaded + test APKs
│   ├── extracted/              # Decompiled Java + unpacked smali/native structure
│   ├── ghidra_output.json      # Ghidra headless output
│   ├── dataset.csv             # Feature vector dataset (for training)
│   └── malware/, benign/       # Sample APKs

├── models/                     # 🤖 AI Models
│   ├── codebert_analyzer.py    # Uses HuggingFace CodeBERT to classify method-level code
│   ├── malware_classifier.py   # Loads and uses RandomForest model
│   └── malware_model.pkl       # Pre-trained RandomForest binary

├── utils/                      # 🔧 Reusable modules
│   ├── feature_extractor.py    # Runs apktool, jadx, permission/api/obfuscation scan
│   ├── ghidra_runner.py        # Automates Ghidra headless
│   ├── asm_inspector.py        # Uses Radare2 to disassemble native code
│   ├── codebert_classifier.py  # CodeBERT inference code
│   ├── unzipper.py             # Analyzes file structure/assets for malware signs
│   ├── extract_methods.py      # Extracts Java method bodies from Decompiled output
│   ├── deobfuscator.py         # Detects smali junk + naming obfuscation
│   └── threat_classifier.py    # Combines all into final rule-based threat summary

├── ghidra_scripts/
│   └── ghidra_extract.py       # Ghidra Python script run during native analysis

├── frontend/                   # 🎨 React Frontend
│   ├── src/
│   │   ├── App.jsx             # Main upload UI + result rendering
│   │   └── components/ThreatReport.jsx # Result visualization component
│   └── package.json            # React dependencies

├── reports/                    # Optional: store report exports
└── ghidra_project/             # Ghidra project files (auto-created)
```

---

## 🛠️ Setup Instructions

### 🔧 Requirements

- Python 3.11+
- Node.js + npm
- Java 17+
- Tools:
  - `apktool`: [Download](https://ibotpeaches.github.io/Apktool/install/)
  - `jadx`: [Download](https://github.com/skylot/jadx)
  - `Ghidra`: [Download](https://ghidra-sre.org)
  - `radare2`: [Download](https://github.com/radareorg/radare2)

### 📦 Python Setup (Backend)

```bash
cd backend/
python -m venv venv
venv\Scripts\activate   # On Windows
pip install -r requirements.txt
```

> Ensure `apktool`, `jadx`, and `r2` are added to your PATH and working from CMD.

### 📦 React Setup (Frontend)

```bash
cd frontend/
npm install
npm start
```

- This runs at `http://localhost:3000`
- Backend is served at `http://localhost:5000`

---

## 🧪 How It Works (Pipeline Explained)

When you upload an `.apk`, the following happens:

1. **Unpack + Decompile**
   - `apktool`: Extracts AndroidManifest + smali
   - `jadx`: Decompiled Java methods
2. **Feature Extraction**
   - `extract_permissions`: Parses manifest
   - `list_api_calls`: Scans Java code
   - `deobfuscate_code`: Detects naming junk
3. **AI Prediction**
   - `RandomForestClassifier`: Predicts malicious/benign based on permission/API count
4. **Ghidra + Radare2**
   - Native `.so` libs analyzed for symbols
5. **CodeBERT**
   - Classifies Java method behavior (malicious, suspicious, benign)
6. **Threat Report**
   - All combined in a JSON response + frontend UI

---

## 📤 Usage

- Launch both backend and frontend
- Upload an APK in the frontend
- Wait 5–15 seconds depending on file size
- See structured report in browser

---

## 🧠 Contribution Tips (for teammates)

- **Frontend** logic lives in `frontend/src/components/ThreatReport.jsx`
- **Backend** starts from `app.py`
- Want to add new checks? Add them inside `utils/` and call from `app.py`
- To train new models, use `train_model.py` and `build_dataset.py`

---

## 👨‍💻 Authors & Contributors

- 🤖 AI by: ChatGPT (OpenAI) + Reverse Engineering logic
- 🧠 Lead Integrator: [Your Name]
- 👥 Repo: https://github.com/Code-aneesh/hackfest

---

## 🏆 Why This Project Is Special

- Combines **reverse engineering + AI + UI**
- One-click, transparent reports
- Hackathon-ready, scalable, and real-world applicable
- Judges will love the technical depth, automation, and explainability

---

## 📸 Sample Report

![Report Screenshot](demo/screenshot.png)

> This README was auto-generated by your AI partner to guide your teammates easily.
