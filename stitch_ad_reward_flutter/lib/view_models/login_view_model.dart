import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  bool _isPasswordVisible = false;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    
    // Simulate login delay
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoading = false;
    notifyListeners();
    
    // Navigate to dashboard after login
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
