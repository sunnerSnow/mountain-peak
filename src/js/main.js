// FigmaTodev 主要 JavaScript 檔案
console.log('FigmaTodev 專案啟動成功！');

// API 基礎配置
const API_BASE_URL = '/api';

// 基本的 API 請求函數
async function apiRequest(endpoint, options = {}) {
    const url = `${API_BASE_URL}${endpoint}`;
    const config = {
        headers: {
            'Content-Type': 'application/json',
        },
        ...options,
    };

    try {
        const response = await fetch(url, config);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return await response.json();
    } catch (error) {
        console.error('API 請求錯誤:', error);
        throw error;
    }
}

// 範例 API 呼叫
async function testConnection() {
    try {
        const result = await apiRequest('/test');
        console.log('API 連接測試:', result);
    } catch (error) {
        console.log('API 尚未設定或無法連接');
    }
}

// 初始化應用程式
document.addEventListener('DOMContentLoaded', () => {
    console.log('DOM 載入完成');
    testConnection();
});

// 導出常用函數
export { apiRequest };