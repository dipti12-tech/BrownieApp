import 'package:flutter/material.dart';
import '../models/signup_request_model.dart';
import '../models/signup_response_model.dart';
import '../services/ApiService.dart';

class SignUpViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SignUpResponse? _response;
  SignUpResponse? get response => _response;

  Future<void> signUp(SignUpRequest request) async {
    _isLoading = true;
    notifyListeners();

    try {
      _response = await _apiService.signUp(request);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
