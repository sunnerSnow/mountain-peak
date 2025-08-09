<?php
// 基本配置
define('APP_NAME', 'FigmaTodev');
define('APP_VERSION', '1.0.0');
define('APP_ENV', 'development'); // development, production

// 時區設定
date_default_timezone_set('Asia/Taipei');

// 錯誤報告設定
if (APP_ENV === 'development') {
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
} else {
    error_reporting(0);
    ini_set('display_errors', 0);
}

// API 設定
define('API_VERSION', 'v1');
define('API_BASE_URL', '/api');

// 安全設定
define('JWT_SECRET', 'your-secret-key-here'); // 請更改為安全的密鑰
define('SESSION_TIMEOUT', 3600); // 1小時

// 檔案上傳設定
define('UPLOAD_MAX_SIZE', 10 * 1024 * 1024); // 10MB
define('UPLOAD_DIR', '../uploads/');

// 允許的檔案類型
$allowed_file_types = [
    'image/jpeg',
    'image/png',
    'image/gif',
    'application/pdf'
];
?>