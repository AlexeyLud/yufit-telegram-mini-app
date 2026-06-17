import 'package:flutter/foundation.dart';
import '../services/api_service.dart';
import '../models/material_model.dart';

class MaterialProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<MaterialModel> _materials = [];
  bool _isLoading = false;
  String? _error;

  List<MaterialModel> get materials => _materials;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchMaterials({int? categoryId}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      String url = '/materials';
      if (categoryId != null) {
        url += '?category_id=$categoryId';
      }

      final response = await _apiService.get(url);

      if (response['success'] == true) {
        _materials = (response['data'] as List)
            .map((item) => MaterialModel.fromJson(item))
            .toList();
      } else {
        throw Exception(response['error'] ?? 'Failed to fetch materials');
      }
    } catch (e) {
      _error = e.toString();
      _materials = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
