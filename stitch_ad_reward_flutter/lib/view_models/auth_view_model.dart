import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void sendOtp(BuildContext context) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1)); // Mock API call
    setLoading(false);
    Navigator.pushNamed(context, '/otp-verification');
  }

  void verifyOtp(BuildContext context) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1)); // Mock API call
    setLoading(false);
    Navigator.pushNamed(context, '/reset-password');
  }

  void resetPassword(BuildContext context) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1)); // Mock API call
    setLoading(false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Password reset successfully!')),
    );
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  @override
  void dispose() {
    emailController.dispose();
    for (var controller in otpControllers) {
      controller.dispose();
    }
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
