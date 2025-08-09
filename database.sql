-- FigmaTodev 資料庫結構
-- 建立資料庫
CREATE DATABASE IF NOT EXISTS figmatodev_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE figmatodev_db;

-- 使用者表
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    profile_image VARCHAR(255),
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_username (username),
    INDEX idx_status (status)
);

-- 專案表
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    user_id INT NOT NULL,
    figma_url VARCHAR(500),
    status ENUM('active', 'completed', 'archived') DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_id (user_id),
    INDEX idx_status (status)
);

-- 設計稿表
CREATE TABLE IF NOT EXISTS designs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    figma_node_id VARCHAR(100),
    design_url VARCHAR(500),
    thumbnail_url VARCHAR(500),
    width INT,
    height INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE,
    INDEX idx_project_id (project_id)
);

-- 生成的代碼表
CREATE TABLE IF NOT EXISTS generated_code (
    id INT AUTO_INCREMENT PRIMARY KEY,
    design_id INT NOT NULL,
    code_type ENUM('html', 'css', 'javascript', 'react', 'vue') NOT NULL,
    code_content LONGTEXT NOT NULL,
    file_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (design_id) REFERENCES designs(id) ON DELETE CASCADE,
    INDEX idx_design_id (design_id),
    INDEX idx_code_type (code_type)
);

-- 系統設定表
CREATE TABLE IF NOT EXISTS settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) NOT NULL UNIQUE,
    setting_value TEXT,
    description VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_setting_key (setting_key)
);

-- 插入預設設定
INSERT INTO settings (setting_key, setting_value, description) VALUES
('site_name', 'FigmaTodev', '網站名稱'),
('max_projects_per_user', '10', '每個使用者最大專案數'),
('supported_export_formats', 'html,css,react,vue', '支援的匯出格式'),
('figma_api_enabled', 'true', '是否啟用 Figma API 整合')
ON DUPLICATE KEY UPDATE setting_value = VALUES(setting_value);

-- 建立預設管理員帳號（密碼: admin123）
INSERT INTO users (username, email, password_hash, first_name, last_name, status) VALUES
('admin', 'admin@figmatodev.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'Admin', 'User', 'active')
ON DUPLICATE KEY UPDATE username = VALUES(username);