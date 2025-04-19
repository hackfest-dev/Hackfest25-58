import React from 'react';

const ScanResults = ({ result }) => {
  if (!result) return null;

  const statStyle = {
    marginBottom: '1rem',
    fontSize: '1rem',
    color: '#444',
    display: 'flex',
    justifyContent: 'space-between'
  };

  const labelStyle = {
    fontWeight: '600',
    color: '#222'
  };

  const valueStyle = (highlight) => ({
    color: highlight ? '#d32f2f' : '#388e3c',
    fontWeight: 'bold'
  });

  return (
    <div
      style={{
        backgroundColor: '#ffffff',
        padding: '2rem',
        borderRadius: '12px',
        boxShadow: '0 2px 10px rgba(0,0,0,0.06)',
        fontFamily: 'Segoe UI, sans-serif',
        maxWidth: '600px',
        margin: '2rem auto',
        border: '1px solid #ddd'
      }}
    >
      <h2 style={{
        color: '#1976d2',
        marginBottom: '1.5rem',
        borderBottom: '1px solid #e0e0e0',
        paddingBottom: '0.5rem'
      }}>
        📊 Quick Threat Summary
      </h2>

      <div style={statStyle}>
        <span style={labelStyle}>🚨 Malicious:</span>
        <span style={valueStyle(result.malicious)}>
          {result.malicious ? 'Yes' : 'No'}
        </span>
      </div>

      <div style={statStyle}>
        <span style={labelStyle}>🔐 Permissions Detected:</span>
        <span>{result.permissions_count}</span>
      </div>

      <div style={statStyle}>
        <span style={labelStyle}>📞 API Calls Found:</span>
        <span>{result.api_calls_count}</span>
      </div>

      <div style={statStyle}>
        <span style={labelStyle}>🕵️ Obfuscation Type:</span>
        <span>{result.obfuscation_type || 'Unknown'}</span>
      </div>

      <div style={statStyle}>
        <span style={labelStyle}>⚙️ Native Code:</span>
        <span>{result.native_code ? 'Present 🧬' : 'None'}</span>
      </div>

      <div style={statStyle}>
        <span style={labelStyle}>🧨 Threats Identified:</span>
        <span>{result.threats?.length || 0}</span>
      </div>
    </div>
  );
};

export default ScanResults;
