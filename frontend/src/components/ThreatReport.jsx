// frontend/src/components/ThreatReport.jsx
import React, { useState } from 'react';

const ThreatReport = ({ data }) => {
  const [openSection, setOpenSection] = useState(null);
  const toggleSection = (sec) => setOpenSection(openSection === sec ? null : sec);

  if (!data) return <p>No data to display.</p>;

  const {
    malicious, permissions = [], permissions_count = 0,
    suspicious_assets = [], native_code, obfuscation_count,
    obfuscation_type, codebert_analysis = [], assembly_inspection = {},
    threats = []
  } = data;

  const sectionStyle = {
    marginTop: '1.5rem', padding: '1rem', borderRadius: '8px',
    backgroundColor: '#fff', border: '1px solid #ddd', boxShadow: '0 1px 3px rgba(0,0,0,0.05)'
  };

  const headingStyle = {
    fontSize: '1.1rem', fontWeight: 'bold', color: '#222',
    cursor: 'pointer', display: 'flex', justifyContent: 'space-between'
  };

  return (
    <div style={{ padding: '2rem', maxWidth: '900px', margin: '0 auto', fontFamily: 'Segoe UI' }}>
      <h2 style={{
        color: malicious ? '#b71c1c' : '#1b5e20',
        backgroundColor: malicious ? '#ffebee' : '#e8f5e9',
        padding: '1rem', borderRadius: '8px', textAlign: 'center'
      }}>
        Verdict: {malicious ? '🚨 Malicious' : '✅ Benign'}
      </h2>

      {/* Permissions */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('permissions')}>
          🔐 Permissions ({permissions_count}) <span>{openSection === 'permissions' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'permissions' && (
          <ul style={{ marginTop: '0.5rem', paddingLeft: '1.5rem' }}>
            {permissions.map((perm, i) => <li key={i}>{perm}</li>)}
          </ul>
        )}
      </section>

      {/* Suspicious Assets */}
      {suspicious_assets.length > 0 && (
        <section style={sectionStyle}>
          <div style={headingStyle} onClick={() => toggleSection('assets')}>
            📁 Suspicious Assets <span>{openSection === 'assets' ? '▲' : '▼'}</span>
          </div>
          {openSection === 'assets' && (
            <ul style={{ marginTop: '0.5rem', paddingLeft: '1.5rem' }}>
              {suspicious_assets.map((a, i) => <li key={i}>{a}</li>)}
            </ul>
          )}
        </section>
      )}

      {/* Obfuscation */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('obfuscation')}>
          🕵️ Obfuscation <span>{openSection === 'obfuscation' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'obfuscation' && (
          <div style={{ marginTop: '0.5rem' }}>
            <p><strong>Type:</strong> {obfuscation_type}</p>
            <p><strong>Obfuscated methods:</strong> {obfuscation_count}</p>
          </div>
        )}
      </section>

      {/* CodeBERT */}
      {codebert_analysis.length > 0 && (
        <section style={sectionStyle}>
          <div style={headingStyle} onClick={() => toggleSection('ai')}>
            🧠 CodeBERT Analysis <span>{openSection === 'ai' ? '▲' : '▼'}</span>
          </div>
          {openSection === 'ai' && (
            <ul style={{ marginTop: '0.5rem', paddingLeft: '1.5rem' }}>
              {codebert_analysis.slice(0, 5).map((m, i) => (
                <li key={i}>
                  <code style={{
                    display: 'block', background: '#f4f4f4', padding: '0.5rem',
                    marginBottom: '0.5rem', whiteSpace: 'pre-wrap'
                  }}>
                    {m.code.slice(0, 100)}...
                  </code>
                  <strong>Type:</strong> {m.type}
                </li>
              ))}
            </ul>
          )}
        </section>
      )}

      {/* Assembly */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('asm')}>
          🔬 Assembly Inspection <span>{openSection === 'asm' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'asm' && (
          <div>
            <p><strong>Status:</strong> {assembly_inspection.status || 'N/A'}</p>
            {assembly_inspection.error && <p style={{ color: 'red' }}>⚠️ {assembly_inspection.error}</p>}
          </div>
        )}
      </section>

      {/* Threats */}
      {threats.length > 0 && (
        <section style={sectionStyle}>
          <div style={headingStyle} onClick={() => toggleSection('threats')}>
            🧨 Threats Identified ({threats.length}) <span>{openSection === 'threats' ? '▲' : '▼'}</span>
          </div>
          {openSection === 'threats' && (
            <ul style={{ marginTop: '0.5rem', paddingLeft: '1.5rem' }}>
              {threats.map((t, i) => (
                <li key={i} style={{ marginBottom: '1rem' }}>
                  <strong>{t.id} ({t.risk}):</strong><br />
                  {t.description}<br />
                  <em>💡 {t.ai_suggestion}</em>
                </li>
              ))}
            </ul>
          )}
        </section>
      )}
    </div>
  );
};

export default ThreatReport;
