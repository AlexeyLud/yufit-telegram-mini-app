# YuFit API Documentation

## Base URL
```
http://localhost:8000/api
```

## Authentication
Include telegram user data in requests.

## Endpoints

### 1. Health Check
```
GET /health
```

**Response:**
```json
{
  "status": "ok",
  "message": "YuFit API is running",
  "timestamp": "2024-02-10 12:30:45"
}
```

### 2. Get Categories
```
GET /categories
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "Мужчинам",
      "icon": "👨",
      "description": "Тренировки специально для мужчин",
      "color": "#0066FF"
    },
    ...
  ]
}
```

### 3. Get Trainings
```
GET /trainings?category_id=1
```

**Parameters:**
- `category_id` (optional): Filter by category

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "title": "Полный курс для начинающих",
      "category_id": 3,
      "price": 299,
      "duration": "4 недели",
      "difficulty": "Легко",
      "image": "https://...",
      "description": "Идеальный старт для новичков",
      "lessons": 12,
      "rating": 4.8
    },
    ...
  ]
}
```

### 4. Get Materials
```
GET /materials?category_id=1
```

**Parameters:**
- `category_id` (optional): Filter by category

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "title": "Гайд по питанию",
      "type": "pdf",
      "size": "2.5 MB",
      "category_id": 3,
      "price": 99,
      "pages": 42,
      "rating": 4.6
    },
    ...
  ]
}
```

### 5. Verify Authentication
```
POST /auth/verify
```

**Request Body:**
```json
{
  "initData": "telegram_init_data_string"
}
```

**Response:**
```json
{
  "success": true,
  "user": {
    "id": 123456789,
    "first_name": "Иван",
    "last_name": "Петров",
    "username": "ivan_petrov",
    "is_premium": true
  },
  "token": "token_string"
}
```

### 6. Get User Profile
```
GET /profile
```

**Response:**
```json
{
  "success": true,
  "data": {
    "id": 123456,
    "first_name": "Иван",
    "last_name": "Петров",
    "username": "ivan_petrov",
    "avatar": "https://...",
    "is_premium": true,
    "joined_date": "2024-01-15",
    "stats": {
      "completed_trainings": 5,
      "total_hours": 42,
      "materials_purchased": 8,
      "current_streak": 7
    },
    "purchased_items": [
      {
        "id": 1,
        "title": "Полный курс",
        "purchased_at": "2024-02-01"
      }
    ]
  }
}
```

## Error Responses

```json
{
  "error": "Error message"
}
```

**Common HTTP Status Codes:**
- `200`: Success
- `400`: Bad Request
- `401`: Unauthorized
- `404`: Not Found
- `500`: Internal Server Error
