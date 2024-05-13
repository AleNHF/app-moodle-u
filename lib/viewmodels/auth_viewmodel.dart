import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:uagrm_app_moodle/models/auth_token_response.dart';
import 'package:uagrm_app_moodle/services/moodle_service.dart';

class AuthViewModel extends ChangeNotifier {
  final MoodleService _moodleService = MoodleService();
  final String _moodleServiceName = 'moodle_mobile_app';
  final storage =  FlutterSecureStorage();
  
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  String register = '';
  String password = '';
  bool _isLoading = false;
  bool _showPassword = false;
  String? _errorMessage;
  
  bool get isLoading => _isLoading;
  bool get showPassword => _showPassword;
  String? get errorMessage => _errorMessage;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<void> authenticate() async {
    if (!isValidForm()) return;

    _isLoading = true;
    notifyListeners();

    try {
      final jsonResponse = await _moodleService.authenticate(register, password, _moodleServiceName);
      final authTokenResponse = AuthTokenResponse.fromJson(jsonResponse);

      await storage.write(key: 'token', value: authTokenResponse.token);

      _errorMessage = null;
    } catch (e) {
      print('Error de autenticación: $e');
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}