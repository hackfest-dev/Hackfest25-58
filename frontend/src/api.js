import axios from 'axios';

const API_BASE = 'http://127.0.0.1:5000';

export const scanApk = async (file) => {
  const formData = new FormData();
  formData.append('apk', file);
  const response = await axios.post(`${API_BASE}/scan`, formData);
  return response.data;
};
