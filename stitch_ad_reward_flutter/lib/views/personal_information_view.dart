import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class PersonalInformationController extends GetxController {
  final nameController = TextEditingController(text: 'Alex Sterling');
  final emailController = TextEditingController(text: 'alex.sterling@ledger.io');
  final phoneController = TextEditingController(text: '+1 (555) 234-8890');
  final profileImageUrl = 'https://lh3.googleusercontent.com/aida-public/AB6AXuAVaGY24k44iIg--blgEzpKbQEx-Orm9MvunBcbn8X18ui2dqRoL-NXoCXuQMgpDqQ5OXuzzmeG00sfG-5IoAbKaoAD2QkZfrEnz4MUOc1TTKKGecpCgfktNbZJpvTwLZuNarwlnC3wIgo0U4wFYxz6jCQk26k-fXu6JsSfpMriN4jPiv0Y3zvjGqDcgHrtfPxChx-HIwmM99ywlfCr1R0UMfosg-hHfUr8G8pk8n4gEfmk9FGObPohbhm-uxF8O9GlZIUF8KiXYQ'.obs;

  void saveChanges() {
    Get.snackbar('Profile Updated', 'Your changes have been saved successfully');
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PersonalInformationController());
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: const Text('Personal Information'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Center(
              child: Text(
                'ADREWARD',
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: -1.0),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            _buildAvatarSection(controller),
            const SizedBox(height: 48),
            AppTextField(
              label: 'Full Name',
              placeholder: 'Enter your full name',
              controller: controller.nameController,
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'Email Address',
              placeholder: 'yourname@example.com',
              controller: controller.emailController,
              prefixIcon: Icons.mail_outline,
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'Phone Number',
              placeholder: '+1 (000) 000-0000',
              controller: controller.phoneController,
              prefixIcon: Icons.call_outlined,
            ),
            const SizedBox(height: 32),
            _buildSecurityNotice(),
            const SizedBox(height: 48),
            AppButton(
              text: 'Save Changes',
              onPressed: controller.saveChanges,
              isGradient: true,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(PersonalInformationController controller) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: Obx(() => CircleAvatar(
                backgroundImage: NetworkImage(controller.profileImageUrl.value),
              )),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                child: const Icon(Icons.edit, color: Colors.black, size: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text('Alex Sterling', style: TextStyle(color: AppColors.onSurface, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 4, backgroundColor: AppColors.primary),
            const SizedBox(width: 8),
            const Text('PRO MEMBER', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          ],
        ),
      ],
    );
  }

  Widget _buildSecurityNotice() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.05)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            top: -20,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.shield_outlined, size: 100, color: AppColors.primary),
            ),
          ),
          Row(
            children: [
              const Icon(Icons.verified_user_outlined, color: AppColors.primary, size: 24),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Encrypted Data', style: TextStyle(color: AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('Your personal data is encrypted and never shared with third-party advertisers without explicit consent.', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11, height: 1.5)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
