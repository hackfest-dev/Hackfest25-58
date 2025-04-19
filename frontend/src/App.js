import React, { useState } from 'react';
import axios from 'axios';
import ThreatReport from './components/ThreatReport';
import ScanResults from './components/ScanResults';

function App() {
  const [apk, setApk] = useState(null);
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleFileChange = (e) => {
    setApk(e.target.files[0]);
    setResult(null); // Clear previous results on new file
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
      alert("❌ Failed to scan APK. Please ensure the backend server is running.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{
      padding: "2rem",
      fontFamily: "Segoe UI, sans-serif",
      maxWidth: "960px",
      margin: "0 auto"
    }}>
      <header style={{
        marginBottom: "2rem",
        textAlign: "center",
        borderBottom: "1px solid #ddd",
        paddingBottom: "1rem"
      }}>
        <h1 style={{ fontSize: "2rem", color: "#1976d2", marginBottom: "0.5rem" }}>
          🛡️ ReverseAI - Malware Analysis Tool
        </h1>
        <p style={{ color: "#555", fontSize: "1rem" }}>
          Upload any APK file and let AI uncover hidden threats using reverse engineering and code analysis.
        </p>
      </header>

      <section style={{
        marginBottom: "2rem",
        display: "flex",
        flexDirection: "column",
        gap: "1rem",
        alignItems: "center"
      }}>
        <input
          type="file"
          accept=".apk"
          onChange={handleFileChange}
          style={{
            padding: "0.5rem",
            border: "1px solid #ccc",
            borderRadius: "6px"
          }}
        />
        <button
          onClick={handleUpload}
          style={{
            padding: "0.6rem 1.4rem",
            background: apk ? "#1e88e5" : "#ccc",
            color: "white",
            fontWeight: "bold",
            border: "none",
            borderRadius: "8px",
            cursor: apk ? "pointer" : "not-allowed"
          }}
          disabled={!apk}
        >
          🔍 Upload & Scan
        </button>
      </section>

      {loading && (
        <div style={{ textAlign: 'center', marginTop: '2rem' }}>
          <div style={{
            border: '6px solid #f3f3f3',
            borderTop: '6px solid #1976d2',
            borderRadius: '50%',
            width: '48px',
            height: '48px',
            animation: 'spin 1s linear infinite',
            margin: '0 auto'
          }} />
          <p style={{ marginTop: '1rem', color: '#555' }}>🔄 Scanning APK... Please wait.</p>

          <style>{`
            @keyframes spin {
              0% { transform: rotate(0deg); }
              100% { transform: rotate(360deg); }
            }
          `}</style>
        </div>
      )}

      {result && (
        <>
          <ScanResults result={result} />
          <div style={{ marginTop: "2rem" }}>
            <ThreatReport data={result} />
          </div>
        </>
      )}
    </div>
  );
}

export default App;
