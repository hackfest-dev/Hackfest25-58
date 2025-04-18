import React from 'react';

const ScanResults = ({ result }) => {
  if (!result) return null;

  return (
    <div>
      <h2>Scan Results</h2>
      <p><strong>Malicious:</strong> {result.malicious ? "Yes" : "No"}</p>
      <p><strong>Permissions Detected:</strong> {result.permissions_count}</p>
      <p><strong>API Calls Found:</strong> {result.api_calls_count}</p>
      <p><strong>Obfuscation Level:</strong> {result.obfuscation_type}</p>
      <p><strong>Native Code:</strong> {result.native_code ? "Present" : "None"}</p>
      <p><strong>Threats:</strong> {result.threats.length}</p>
    </div>
  );
};

export default ScanResults;
