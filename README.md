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

