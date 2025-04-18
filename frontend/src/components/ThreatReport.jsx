import React from 'react';

const ThreatReport = ({ data }) => {
  if (!data) return <p>No data to display.</p>;

  const {
    malicious,
    permissions = [],
    permissions_count = 0,
    suspicious_assets = [],
    native_code = false,
    obfuscation_count = 0,
    obfuscation_type = 'Unknown',
    codebert_analysis = [],
    assembly_inspection = {}
  } = data;

  return (
    <div style={{
      backgroundColor: '#fafafa',
      padding: '1.5rem',
      borderRadius: '10px',
      boxShadow: '0 0 5px #ccc',
      fontFamily: 'sans-serif'
    }}>
      <h2 style={{
        color: malicious ? '#d32f2f' : '#388e3c',
        backgroundColor: malicious ? '#ffebee' : '#e8f5e9',
        padding: '0.75rem',
        borderRadius: '6px'
      }}>
        Verdict: {malicious ? '🚨 Malicious' : '✅ Benign'}
      </h2>

      <section style={{ marginTop: '1.5rem' }}>
        <h3>🔐 Permissions ({permissions_count})</h3>
        {permissions.length > 0 ? (
          <ul>
            {permissions.map((perm, index) => (
              <li key={index}>{perm}</li>
            ))}
          </ul>
        ) : <p>None found</p>}
      </section>

      {suspicious_assets.length > 0 && (
        <section style={{ marginTop: '1.5rem' }}>
          <h3>📁 Suspicious Native Libraries</h3>
          <ul>
            {suspicious_assets.map((asset, index) => (
              <li key={index}>{asset}</li>
            ))}
          </ul>
        </section>
      )}

      <section style={{ marginTop: '1.5rem' }}>
        <h3>⚙️ Native Code</h3>
        <p>{native_code ? 'Present 🧬' : 'None detected'}</p>
      </section>

      <section style={{ marginTop: '1.5rem' }}>
        <h3>🕵️ Obfuscation</h3>
        <p><strong>Type:</strong> {obfuscation_type}</p>
        <p><strong>Obfuscated methods:</strong> {obfuscation_count}</p>
      </section>

      {codebert_analysis.length > 0 && (
        <section style={{ marginTop: '1.5rem' }}>
          <h3>🧠 CodeBERT Threat Classification</h3>
          <ul>
            {codebert_analysis.slice(0, 5).map((method, index) => (
              <li key={index}>
                <code style={{ display: 'block', marginBottom: '0.5rem', whiteSpace: 'pre-wrap' }}>
                  {method.code.slice(0, 100)}...
                </code>
                <strong>Type:</strong> {method.type}
              </li>
            ))}
          </ul>
          {codebert_analysis.length > 5 && (
            <p>...and {codebert_analysis.length - 5} more methods analyzed.</p>
          )}
        </section>
      )}

      <section style={{ marginTop: '1.5rem' }}>
        <h3>🔬 Assembly Inspection</h3>
        <p><strong>Status:</strong> {assembly_inspection.status || 'N/A'}</p>

        {assembly_inspection.error && (
          <p style={{ color: 'red' }}>⚠️ {assembly_inspection.error}</p>
        )}

        {assembly_inspection.instructions?.length > 0 && (
          <div style={{ background: '#eee', padding: '1rem', borderRadius: '6px', marginTop: '1rem' }}>
            <h4>📄 Sample Instructions</h4>
            <pre style={{ fontSize: '0.85rem', maxHeight: '300px', overflowY: 'auto' }}>
              {assembly_inspection.instructions.join('\n')}
            </pre>
            <p style={{ marginTop: '0.5rem' }}>
              Total instructions parsed: {assembly_inspection.instruction_count}
            </p>
          </div>
        )}
      </section>
    </div>
  );
};

export default ThreatReport;
