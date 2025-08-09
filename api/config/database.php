<?php
// 資料庫配置
class Database {
    private $host = 'localhost';
    private $db_name = 'figmatodev_db';
    private $username = 'root';
    private $password = '';
    private $connection;

    // 取得資料庫連接
    public function getConnection() {
        $this->connection = null;
        
        try {
            $dsn = "mysql:host=" . $this->host . ";dbname=" . $this->db_name . ";charset=utf8mb4";
            $this->connection = new PDO($dsn, $this->username, $this->password);
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch(PDOException $e) {
            echo "連接錯誤: " . $e->getMessage();
        }
        
        return $this->connection;
    }
    
    // 測試資料庫連接
    public function testConnection() {
        $connection = $this->getConnection();
        if ($connection) {
            return [
                'status' => 'success',
                'message' => '資料庫連接成功',
                'database' => $this->db_name
            ];
        } else {
            return [
                'status' => 'error',
                'message' => '資料庫連接失敗'
            ];
        }
    }
}

// 全域資料庫實例
$database = new Database();
$db = $database->getConnection();
?>