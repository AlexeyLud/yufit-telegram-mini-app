import 'package:flutter/foundation.dart';
import 'package:telegram_web_app/telegram_web_app.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  UserModel? _user;
  String? _token;
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _error;

  UserModel? get user => _user;
  String? get token => _token;
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> authenticate() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Get Telegram WebApp instance
      final webApp = TelegramWebApp.instance;
      
      if (webApp == null) {
        throw Exception('Telegram Web App not available');
      }

      // Get init data from Telegram
      final initData = webApp.initData;
      
      if (initData.isEmpty) {
        throw Exception('No init data from Telegram');
      }

      // Verify with backend
      final response = await _apiService.post(
        '/auth/verify',
        body: {'initData': initData},
      );

      if (response['success'] == true) {
        _token = response['token'];
        _user = UserModel.fromJson(response['user']);
        _isAuthenticated = true;
      } else {
        throw Exception(response['error'] ?? 'Authentication failed');
      }
    } catch (e) {
      _error = e.toString();
      _isAuthenticated = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    _token = null;
    _isAuthenticated = false;
    _error = null;
    notifyListeners();
  }
}
