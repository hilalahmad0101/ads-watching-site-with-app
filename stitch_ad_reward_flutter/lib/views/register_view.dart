import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/register_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.background,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Back Button
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back, color: AppColors.primary),
              ),
              const SizedBox(height: 32),
              // Title
              const Text(
                'Create Account',
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join our community of earners and start rewarded journey today.',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              // Inputs
              AppTextField(
                label: 'Full Name',
                placeholder: 'John Doe',
                prefixIcon: Icons.person_outline,
                controller: controller.nameController,
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Email Address',
                placeholder: 'hello@example.com',
                prefixIcon: Icons.email_outlined,
                controller: controller.emailController,
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Create Password',
                placeholder: '••••••••',
                prefixIcon: Icons.lock_outline,
                controller: controller.passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 24),
              AppTextField(
                label: 'Confirm Password',
                placeholder: '••••••••',
                prefixIcon: Icons.lock_reset_outlined,
                controller: controller.confirmPasswordController,
                isPassword: true,
              ),
              const SizedBox(height: 32),
              // Terms checkbox
              Row(
                children: [
                  Obx(() => Checkbox(
                    value: controller.agreeToTerms,
                    onChanged: (val) => controller.setAgreeToTerms(val ?? false),
                    activeColor: AppColors.primary,
                    checkColor: AppColors.onPrimary,
                  )),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        text: 'By signing up, you agree to our ',
                        style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
                        children: [
                          TextSpan(text: 'Terms of Service', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                          TextSpan(text: ' and '),
                          TextSpan(text: 'Privacy Policy', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              // Register Button
              Obx(() => AppButton(
                text: 'Create Account',
                isLoading: controller.isLoading,
                onPressed: controller.signUp,
              )),
              const SizedBox(height: 32),
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
