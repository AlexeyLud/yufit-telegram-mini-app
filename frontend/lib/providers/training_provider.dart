import 'package:flutter/foundation.dart';
import '../services/api_service.dart';
import '../models/training_model.dart';

class TrainingProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<TrainingModel> _trainings = [];
  bool _isLoading = false;
  String? _error;

  List<TrainingModel> get trainings => _trainings;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTrainings({int? categoryId}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      String url = '/trainings';
      if (categoryId != null) {
        url += '?category_id=$categoryId';
      }

      final response = await _apiService.get(url);

      if (response['success'] == true) {
        _trainings = (response['data'] as List)
            .map((item) => TrainingModel.fromJson(item))
            .toList();
      } else {
        throw Exception(response['error'] ?? 'Failed to fetch trainings');
      }
    } catch (e) {
      _error = e.toString();
      _trainings = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
