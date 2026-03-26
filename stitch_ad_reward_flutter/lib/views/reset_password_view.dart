import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.password_rounded, size: 72, color: AppColors.primary),
            const SizedBox(height: 32),
            const Text(
              'Reset Password',
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.0,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Almost there! Enter a secure new password for your account.',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 48),
            AppTextField(
              label: 'New Password',
              placeholder: '••••••••',
              controller: controller.newPasswordController,
              prefixIcon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'Confirm New Password',
              placeholder: '••••••••',
              controller: controller.confirmPasswordController,
              prefixIcon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 48),
            Obx(() => AppButton(
              text: 'Confirm Reset',
              isLoading: controller.isLoading,
              onPressed: controller.resetPassword,
            )),
          ],
        ),
      ),
    );
  }
}
