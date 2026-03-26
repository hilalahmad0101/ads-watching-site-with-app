import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  
  final _agreeToTerms = false.obs;
  bool get agreeToTerms => _agreeToTerms.value;

  void setAgreeToTerms(bool value) {
    _agreeToTerms.value = value;
  }

  Future<void> signUp() async {
    if (!_agreeToTerms.value) {
      Get.snackbar(
        'Terms of Service',
        'Please agree to the Terms of Service',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
      return;
    }

    _isLoading.value = true;
    
    // Simulate signup delay
    await 2.delay();
    
    _isLoading.value = false;
    
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
