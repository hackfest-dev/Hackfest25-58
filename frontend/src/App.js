// frontend/src/App.jsx

import React, { useState } from 'react';
import axios from 'axios';
import ThreatReport from './components/ThreatReport';

function App() {
  const [apk, setApk] = useState(null);
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleFileChange = (e) => {
    setApk(e.target.files[0]);
    setResult(null); // Reset previous result on new file select
  };

  const handleUpload = async () => {
    if (!apk) {
      alert("📂 Please select an APK file first.");
      return;
    }

    const formData = new FormData();
    formData.append("apk", apk);

    setLoading(true);
    setResult(null);
    try {
      const response = await axios.post("http://localhost:5000/scan", formData);
      setResult(response.data);
    } catch (err) {
      console.error("Upload error:", err);
      alert("❌ Failed to scan APK. Check if backend is running.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{
      padding: "2rem",
      fontFamily: "Segoe UI, sans-serif",
      maxWidth: "900px",
      margin: "0 auto"
    }}>
      <h1 style={{ fontSize: "1.8rem", marginBottom: "1rem" }}>🛡️ ReverseAI - Malware Analysis Tool</h1>

      <div style={{ marginBottom: "1rem" }}>
        <input type="file" accept=".apk" onChange={handleFileChange} />
        <button
          onClick={handleUpload}
          style={{
            marginLeft: "1rem",
            padding: "0.5rem 1rem",
            background: "#1e88e5",
            color: "#fff",
            border: "none",
            borderRadius: "4px",
            cursor: "pointer"
          }}
        >
          Upload & Scan
        </button>
      </div>

      {loading && (
        <p style={{ marginTop: "1rem", color: "#888" }}>
          🔄 Scanning APK... Please wait.
        </p>
      )}

      {result && (
        <div style={{ marginTop: "2rem" }}>
          <ThreatReport data={result} />
        </div>
      )}
    </div>
  );
}

export default App;
