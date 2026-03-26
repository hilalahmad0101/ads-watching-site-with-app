import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final otpControllers = List.generate(4, (index) => TextEditingController());
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  Future<void> sendOtp() async {
    setLoading(true);
    await 1.delay();
    setLoading(false);
    Get.toNamed('/otp-verification');
  }

  Future<void> verifyOtp() async {
    setLoading(true);
    await 1.delay();
    setLoading(false);
    Get.toNamed('/reset-password');
  }

  Future<void> resetPassword() async {
    setLoading(true);
    await 1.delay();
    setLoading(false);
    Get.snackbar('Success', 'Password reset successfully!');
    Get.offAllNamed('/');
  }

  @override
  void onClose() {
    emailController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
