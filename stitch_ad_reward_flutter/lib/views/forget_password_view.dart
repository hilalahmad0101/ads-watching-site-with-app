import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.lock_reset_rounded, size: 72, color: AppColors.primary),
            const SizedBox(height: 32),
            const Text(
              'Forgot Password?',
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.0,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Don\'t worry! It happens. Please enter the email associated with your account.',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 48),
            AppTextField(
              label: 'Email Address',
              placeholder: 'hello@example.com',
              controller: controller.emailController,
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(height: 32),
            Obx(() => AppButton(
              text: 'Send Code',
              isLoading: controller.isLoading,
              onPressed: controller.sendOtp,
            )),
          ],
        ),
      ),
    );
  }
}
