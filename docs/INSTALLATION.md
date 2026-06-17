# YuFit Installation Guide

## Backend Setup (PHP)

### Prerequisites
- PHP 8.0 or higher
- Composer
- MySQL/PostgreSQL or SQLite

### Installation Steps

1. **Clone the repository**
```bash
git clone https://github.com/AlexeyLud/yufit-telegram-mini-app.git
cd yufit-telegram-mini-app
```

2. **Setup Backend**
```bash
cd backend
cp .env.example .env
```

3. **Edit .env file with your settings**
```
DB_HOST=localhost
DB_PORT=3306
DB_NAME=yufit
DB_USER=root
DB_PASSWORD=your_password

TELEGRAM_BOT_TOKEN=your_bot_token
TELEGRAM_WEBAPP_SECRET=your_secret
```

4. **Install dependencies**
```bash
composer install
```

5. **Start PHP server**
```bash
php -S localhost:8000
```

## Frontend Setup (Flutter Web)

### Prerequisites
- Flutter 3.0 or higher
- Chrome browser

### Installation Steps

1. **Navigate to frontend**
```bash
cd frontend
```

2. **Get Flutter dependencies**
```bash
flutter pub get
```

3. **Run Flutter Web**
```bash
flutter run -d chrome
```

The app should open in your default Chrome browser at `http://localhost:3000`

## Telegram Bot Integration

1. **Create bot via BotFather**
   - Open [@BotFather](https://t.me/botfather) on Telegram
   - Send `/newbot` command
   - Follow instructions and save your token

2. **Set Webhook URL**
   - Send `/setwebhook` to BotFather
   - Provide your backend URL

3. **Create Web App**
   - Send `/newapp` to BotFather
   - Set Web App URL to your deployed frontend URL

## API Endpoints

### Categories
```
GET /api/categories
```

### Trainings
```
GET /api/trainings?category_id=1
```

### Materials
```
GET /api/materials?category_id=1
```

### Authentication
```
POST /api/auth/verify
Body: { "initData": "..." }
```

### Profile
```
GET /api/profile
```

## Troubleshooting

### CORS Errors
- Ensure backend headers allow cross-origin requests
- Check frontend API URL in `lib/services/api_service.dart`

### Telegram Web App Not Loading
- Verify bot is properly configured in BotFather
- Check that Mini App URL is publicly accessible

### Database Connection Issues
- Verify credentials in .env file
- Ensure database server is running
- Check database exists

## Production Deployment

1. **Backend**
   - Deploy to hosting with PHP support
   - Use environment variables for sensitive data
   - Enable HTTPS

2. **Frontend**
   - Build Flutter Web
   - Deploy to Vercel, Netlify, or similar
   - Configure CORS properly

```bash
cd frontend
flutter build web
```

## Support

For issues and questions, create an issue on GitHub.
