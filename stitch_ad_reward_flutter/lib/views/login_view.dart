import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    
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
              // Logo
              const Text(
                'ADREWARD PRO',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 48),
              // Welcome Text
              const Text(
                'Welcome Back',
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue earning rewards from premium ads and challenges.',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              // Inputs
              AppTextField(
                label: 'Email Address',
                placeholder: 'hello@example.com',
                prefixIcon: Icons.email_outlined,
                controller: controller.emailController,
              ),
              const SizedBox(height: 24),
              Obx(() => AppTextField(
                label: 'Password',
                placeholder: '••••••••',
                prefixIcon: Icons.lock_outline,
                controller: controller.passwordController,
                isPassword: !controller.isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.onSurfaceVariant,
                    size: 20,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
              )),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Get.toNamed('/forget-password'),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Login Button
              Obx(() => AppButton(
                text: 'Sign In',
                isLoading: controller.isLoading,
                onPressed: controller.login,
              )),
              const SizedBox(height: 32),
              // Social Login divider
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.surfaceContainerHigh)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(child: Divider(color: AppColors.surfaceContainerHigh)),
                ],
              ),
              const SizedBox(height: 32),
              // Register Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New to AdReward? ',
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed('/register'),
                    child: const Text(
                      'Create Account',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
