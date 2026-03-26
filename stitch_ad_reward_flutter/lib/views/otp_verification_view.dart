import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({super.key});

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
            const Icon(Icons.mark_email_unread_rounded, size: 72, color: AppColors.primary),
            const SizedBox(height: 32),
            const Text(
              'Verification Code',
              style: TextStyle(
                color: AppColors.onSurface,
                fontSize: 32,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.0,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'We have sent a 4-digit verification code to your email address.',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14, height: 1.5),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) => _buildOtpField(context, index, controller)),
            ),
            const SizedBox(height: 48),
            Obx(() => AppButton(
              text: 'Verify Account',
              isLoading: controller.isLoading,
              onPressed: controller.verifyOtp,
            )),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Didn\'t receive the code? ',
                  style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Resend Code',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpField(BuildContext context, int index, AuthController controller) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextField(
        controller: controller.otpControllers[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.onSurface),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.surfaceContainerHigh),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.primary, width: 2),
          ),
          fillColor: AppColors.surfaceContainerLow,
          filled: true,
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
