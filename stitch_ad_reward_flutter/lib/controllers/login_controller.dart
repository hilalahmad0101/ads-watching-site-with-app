import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  
  final _isPasswordVisible = false.obs;
  bool get isPasswordVisible => _isPasswordVisible.value;

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  Future<void> login() async {
    _isLoading.value = true;
    
    // Simulate login delay
    await 2.delay();
    
    _isLoading.value = false;
    
    // Navigate to dashboard after login
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
