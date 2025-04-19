import React, { useState } from 'react';

const sectionStyle = {
  marginTop: '1.5rem',
  padding: '1rem',
  borderRadius: '8px',
  backgroundColor: '#ffffff',
  border: '1px solid #ddd',
  boxShadow: '0 1px 3px rgba(0,0,0,0.05)'
};

const headingStyle = {
  fontSize: '1.1rem',
  fontWeight: 'bold',
  color: '#222',
  cursor: 'pointer',
  display: 'flex',
  justifyContent: 'space-between',
  alignItems: 'center'
};

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

  const [openSection, setOpenSection] = useState(null);

  const toggleSection = (section) =>
    setOpenSection(openSection === section ? null : section);

  return (
    <div style={{
      backgroundColor: '#f9fafc',
      padding: '2rem',
      borderRadius: '12px',
      fontFamily: 'Segoe UI, sans-serif',
      maxWidth: '900px',
      margin: '0 auto'
    }}>
      <h2 style={{
        color: malicious ? '#b71c1c' : '#1b5e20',
        backgroundColor: malicious ? '#ffebee' : '#e8f5e9',
        padding: '1rem',
        borderRadius: '8px',
        textAlign: 'center',
        fontSize: '1.5rem'
      }}>
        Verdict: {malicious ? '🚨 Malicious' : '✅ Benign'}
      </h2>

      {/* Permissions */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('permissions')}>
          🔐 Permissions ({permissions_count})
          <span>{openSection === 'permissions' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'permissions' && (
          permissions.length > 0 ? (
            <ul style={{ marginTop: '0.5rem', paddingLeft: '1.5rem' }}>
              {permissions.map((perm, i) => <li key={i}>{perm}</li>)}
            </ul>
          ) : <p style={{ color: '#777' }}>None found</p>
        )}
      </section>

      {/* Suspicious Libraries */}
      {suspicious_assets.length > 0 && (
        <section style={sectionStyle}>
          <div style={headingStyle} onClick={() => toggleSection('libs')}>
            📁 Suspicious Native Libraries
            <span>{openSection === 'libs' ? '▲' : '▼'}</span>
          </div>
          {openSection === 'libs' && (
            <ul style={{ marginTop: '0.5rem', paddingLeft: '1.5rem' }}>
              {suspicious_assets.map((lib, i) => <li key={i}>{lib}</li>)}
            </ul>
          )}
        </section>
      )}

      {/* Native Code */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('native')}>
          ⚙️ Native Code
          <span>{openSection === 'native' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'native' && (
          <p style={{ marginTop: '0.5rem' }}>{native_code ? 'Present 🧬' : 'None detected'}</p>
        )}
      </section>

      {/* Obfuscation */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('obfuscation')}>
          🕵️ Obfuscation
          <span>{openSection === 'obfuscation' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'obfuscation' && (
          <div style={{ marginTop: '0.5rem' }}>
            <p><strong>Type:</strong> {obfuscation_type}</p>
            <p><strong>Obfuscated methods:</strong> {obfuscation_count}</p>
          </div>
        )}
      </section>

      {/* CodeBERT Analysis */}
      {codebert_analysis.length > 0 && (
        <section style={sectionStyle}>
          <div style={headingStyle} onClick={() => toggleSection('codebert')}>
            🧠 CodeBERT Threat Classification
            <span>{openSection === 'codebert' ? '▲' : '▼'}</span>
          </div>
          {openSection === 'codebert' && (
            <>
              <ul style={{ marginTop: '0.5rem', paddingLeft: '1.2rem' }}>
                {codebert_analysis.slice(0, 5).map((method, i) => (
                  <li key={i} style={{ marginBottom: '1rem' }}>
                    <code style={{
                      display: 'block',
                      backgroundColor: '#f0f0f0',
                      padding: '0.5rem',
                      borderRadius: '4px',
                      fontSize: '0.85rem',
                      whiteSpace: 'pre-wrap'
                    }}>
                      {method.code.slice(0, 100)}...
                    </code>
                    <strong>Type:</strong> {method.type}
                  </li>
                ))}
              </ul>
              {codebert_analysis.length > 5 && (
                <p style={{ color: '#777' }}>
                  ...and {codebert_analysis.length - 5} more methods analyzed.
                </p>
              )}
            </>
          )}
        </section>
      )}

      {/* Assembly Inspection */}
      <section style={sectionStyle}>
        <div style={headingStyle} onClick={() => toggleSection('asm')}>
          🔬 Assembly Inspection
          <span>{openSection === 'asm' ? '▲' : '▼'}</span>
        </div>
        {openSection === 'asm' && (
          <div style={{ marginTop: '0.5rem' }}>
            <p><strong>Status:</strong> {assembly_inspection.status || 'N/A'}</p>

            {assembly_inspection.error && (
              <p style={{ color: 'red' }}>⚠️ {assembly_inspection.error}</p>
            )}

            {assembly_inspection.instructions?.length > 0 && (
              <div style={{
                backgroundColor: '#f4f4f4',
                padding: '1rem',
                borderRadius: '6px',
                marginTop: '1rem'
              }}>
                <h4 style={{ marginBottom: '0.5rem' }}>📄 Sample Instructions</h4>
                <pre style={{
                  fontSize: '0.85rem',
                  maxHeight: '300px',
                  overflowY: 'auto',
                  whiteSpace: 'pre-wrap',
                  background: '#e0e0e0',
                  padding: '0.5rem',
                  borderRadius: '4px'
                }}>
                  {assembly_inspection.instructions.join('\n')}
                </pre>
                <p style={{ marginTop: '0.5rem' }}>
                  Total instructions parsed: {assembly_inspection.instruction_count}
                </p>
              </div>
            )}
          </div>
        )}
      </section>
    </div>
  );
};

export default ThreatReport;
