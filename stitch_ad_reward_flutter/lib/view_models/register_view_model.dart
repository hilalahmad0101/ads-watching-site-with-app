import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  bool _agreeToTerms = false;
  bool get agreeToTerms => _agreeToTerms;

  void setAgreeToTerms(bool value) {
    _agreeToTerms = value;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context) async {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the Terms of Service')),
      );
      return;
    }

    _isLoading = true;
    notifyListeners();
    
    // Simulate signup delay
    await Future.delayed(const Duration(seconds: 2));
    
    _isLoading = false;
    notifyListeners();
    
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
