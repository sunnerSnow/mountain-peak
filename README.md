# FigmaTodev

一個使用 Vite + Sass + PHP + MySQL 技術棧的 Figma 轉開發工具專案。

## 技術棧

- **前端**: Vite + Sass + JavaScript
- **後端**: PHP
- **資料庫**: MySQL
- **版本控制**: Git

## 專案結構

```
figmaTodev/
├── src/                 # 前端源碼
│   ├── styles/         # Sass 樣式文件
│   │   ├── main.scss   # 主樣式文件
│   │   └── variables.scss # 變數定義
│   └── js/             # JavaScript 文件
│       └── main.js     # 主 JS 文件
├── api/                # PHP 後端 API
│   ├── config/         # 配置文件
│   ├── models/         # 資料模型
│   └── controllers/    # 控制器
├── public/             # 靜態資源
├── database.sql        # 資料庫結構
├── index.html          # 主頁面
├── vite.config.js      # Vite 配置
└── package.json        # 專案配置
```

## 開始使用

### 1. 安裝依賴

```bash
npm install
```

### 2. 設定資料庫

1. 建立 MySQL 資料庫
2. 執行 `database.sql` 文件來建立表結構
3. 修改 `api/config/database.php` 中的資料庫連接設定

### 3. 啟動開發伺服器

```bash
# 同時啟動前端和後端伺服器
npm start

# 或分別啟動
npm run dev          # 前端開發伺服器 (port 5173)
npm run php-server   # PHP 後端伺服器 (port 8000)
```

### 4. 建置專案

```bash
npm run build
```

## API 端點

- `GET /api/` - API 基本資訊
- `GET /api/test` - 測試 API 連接

## 開發說明

- 前端使用 Vite 作為建置工具，支援熱重載
- 使用 Sass 作為 CSS 預處理器
- PHP 後端提供 RESTful API
- 支援跨域請求 (CORS)
- 包含基本的錯誤處理和安全設定

## GitHub 儲存庫

https://github.com/sexfat/figmaTodev.git

## 分支說明

- `master` - 主分支（生產環境）
- `dev` - 開發分支