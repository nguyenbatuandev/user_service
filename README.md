# 🚀 User Service API


## ⚡ Quick Start

### 1. Clone Repository
```bash
git clone <repository-url>
cd User_Service
```

### 2. Chạy Dự Án với Docker
```bash
docker-compose up --build
```

API sẽ chạy tại: `http://localhost:8080`

---

## 📚 API Endpoints

**Base URL:** `http://localhost:8080`  
**Auth Header:** `Authorization: Bearer <jwt-token>`

### Public Endpoints
- **Register**
  ```
  POST /api/v1/register
  {
    "name": "Test User",
    "email": "test@example.com",
    "password": "password123",
    "role": "user" (buyer , partner , admin)
  }
  ```
- **Login**
  ```
  POST /api/v1/login
  {
    "email": "test@example.com",
    "password": "password123"
  }
  ```

### Protected Endpoints (Yêu cầu JWT Token)
- **Get Profile**
  ```
  GET /api/v1/get-profile
  Authorization: Bearer <token>
  ```
- **Update Profile**
  ```
  PATCH /api/v1/update-profile
  Authorization: Bearer <token>
  {
    "name": "Updated Name"
  }
  ```
- **Delete User**
  ```
  DELETE /api/v1/delete-profile
  Authorization: Bearer <token>
  ```

### Admin Endpoints
- **Toggle User Lock**
  ```
  POST /api/admin/toggle-user-lock/:id
  Authorization: Bearer <admin-token>
  ```
- **Get All Users**
  ```
  GET /api/admin/get-all-user
  Authorization: Bearer <admin-token>
  ```

---

## 🐳 Lệnh Docker

- **Khởi chạy container**
  ```bash
  docker-compose up --build
  ```
- **Chạy background**
  ```bash
  docker-compose up -d --build
  ```
- **Dừng container**
  ```bash
  docker-compose down
  ```
- **Xem logs**
  ```bash
  docker-compose logs -f user_service
  ```
- **Reset (xóa data)**
  ```bash
  docker-compose down -v
  ```

---

## 🔧 Biến môi trường

Cấu hình trong file `.env` hoặc `docker-compose.yml`:

```env
# Database
DB_HOST=postgres
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=password123
DB_NAME=user_service
DB_SSLMODE=disable

# JWT
JWT_SECRET=qwertyuiopiuytsdfghjkllkjhgfddfghjklkjhgfddfghjkkj
JWT_EXPIRES_IN=24

# Server
SERVER_PORT=8080
GIN_MODE=release
```

---

## 📁 Câu trúc dự án

```
User_Service/
├── main.go                 # Entry point
├── go.mod                  # Go modules
├── go.sum                  # Dependencies checksums
├── Dockerfile              # Docker image definition
├── docker-compose.yml      # Docker services configuration
├── init.sql                # Database initialization
├── .env                    # Environment variables (local)
├── README.md               # Documentation
│
└── internal/               # Internal packages
    ├── config/             # Configuration management
    ├── database/           # Database connection
    ├── entity/             # Data models
    ├── handler/            # HTTP handlers
    ├── interface/          # Interfaces
    ├── middleware/         # HTTP middlewares
    ├── repository/         # Data access layer
    └── service/            # Business logic
```

## 🔒 Security Features

- ✅ **Password Hashing**: Sử dụng bcrypt với cost factor 12.
- ✅ **JWT Authentication**: Token có thời hạn 24 giờ.
- ✅ **Input Validation**: Validate tất cả input với struct tags.
- ✅ **SQL Injection Prevention**: Sử dụng GORM ORM.
- ✅ **CORS Protection**: Configure CORS middleware.
- ✅ **Environment Variables**: Sensitive data được lưu trong `.env`.

