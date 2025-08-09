<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// 處理 OPTIONS 請求（CORS preflight）
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

// 引入配置文件
require_once 'config/database.php';
require_once 'config/config.php';

// 簡單的路由系統
$request_uri = $_SERVER['REQUEST_URI'];
$request_method = $_SERVER['REQUEST_METHOD'];

// 移除查詢參數
$path = parse_url($request_uri, PHP_URL_PATH);
$path = str_replace('/api', '', $path);

try {
    switch ($path) {
        case '/test':
            if ($request_method === 'GET') {
                echo json_encode([
                    'status' => 'success',
                    'message' => 'API 連接正常',
                    'timestamp' => date('Y-m-d H:i:s')
                ]);
            }
            break;
            
        case '/':
        case '':
            echo json_encode([
                'name' => 'FigmaTodev API',
                'version' => '1.0.0',
                'description' => 'Vite + Sass + PHP + MySQL 專案 API'
            ]);
            break;
            
        default:
            http_response_code(404);
            echo json_encode([
                'error' => 'API 路由不存在',
                'path' => $path
            ]);
            break;
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'error' => '伺服器內部錯誤',
        'message' => $e->getMessage()
    ]);
}
?>