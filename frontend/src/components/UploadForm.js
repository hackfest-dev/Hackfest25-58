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
    <form onSubmit={handleSubmit}>
      <input type="file" accept=".apk" onChange={(e) => setApkFile(e.target.files[0])} />
      <button type="submit">Scan APK</button>
    </form>
  );
};

export default UploadForm;
