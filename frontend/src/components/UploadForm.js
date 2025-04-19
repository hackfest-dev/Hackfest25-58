import React, { useState } from 'react';

const UploadForm = ({ onScan }) => {
  const [apkFile, setApkFile] = useState(null);

  const handleSubmit = (e) => {
    e.preventDefault();
    if (apkFile) {
      onScan(apkFile);
    }
  };

  return (
    <form
      onSubmit={handleSubmit}
      style={{
        backgroundColor: '#f9f9f9',
        padding: '2rem',
        borderRadius: '12px',
        boxShadow: '0 0 10px rgba(0,0,0,0.05)',
        textAlign: 'center',
        maxWidth: '600px',
        margin: '2rem auto',
        fontFamily: 'Segoe UI, sans-serif',
        border: '1px solid #ddd'
      }}
    >
      <h2 style={{ marginBottom: '1rem', color: '#333' }}>
        🔍 Upload APK for Analysis
      </h2>

      <input
        type="file"
        accept=".apk"
        onChange={(e) => setApkFile(e.target.files[0])}
        style={{
          marginBottom: '1rem',
          padding: '0.5rem',
          border: '1px solid #ccc',
          borderRadius: '6px',
          backgroundColor: '#fff',
          cursor: 'pointer',
          width: '100%'
        }}
      />

      {apkFile && (
        <p style={{
          fontSize: '0.9rem',
          color: '#555',
          marginBottom: '1rem',
          wordWrap: 'break-word'
        }}>
          📄 Selected: <strong>{apkFile.name}</strong>
        </p>
      )}

      <button
        type="submit"
        disabled={!apkFile}
        style={{
          padding: '0.7rem 1.5rem',
          border: 'none',
          borderRadius: '8px',
          backgroundColor: apkFile ? '#1976d2' : '#ccc',
          color: 'white',
          fontWeight: 'bold',
          cursor: apkFile ? 'pointer' : 'not-allowed'
        }}
      >
        🚀 Scan APK
      </button>
    </form>
  );
};

export default UploadForm;
