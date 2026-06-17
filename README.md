# YuFit - Telegram Mini App

Telegram Mini App для продажи тренировок и документации с поддержкой различных категорий пользователей.

## Структура проекта

```
yufit-telegram-mini-app/
├── backend/                 # PHP Backend
│   ├── api/
│   ├── config/
│   ├── database/
│   └── .env.example
├── frontend/                # Flutter Web
│   ├── lib/
│   ├── assets/
│   └── pubspec.yaml
└── docs/                    # Документация
```

## Функции

- **Категории пользователей**: Мужчинам, Девушкам, Новичкам, Опытным, Продвинутым
- **3 вкладки**: Тренировки, Материалы, Профиль
- **Интеграция с Telegram**: Авторизация через Telegram Web App API
- **Тёмная тема**: Чёрный, синий, белый, серый

## Требования

- PHP 8.0+
- Flutter 3.0+
- MySQL/PostgreSQL или SQLite

## Установка

### Backend (PHP)

```bash
cd backend
cp .env.example .env
# Отредактируйте .env с вашими настройками
composer install
```

### Frontend (Flutter Web)

```bash
cd frontend
flutter pub get
flutter run -d chrome
```

## Лицензия

Private - только для личного использования
