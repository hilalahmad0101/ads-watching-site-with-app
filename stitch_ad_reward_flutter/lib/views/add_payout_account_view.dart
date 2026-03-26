import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/payout_account_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';

class AddPayoutAccountView extends StatelessWidget {
  const AddPayoutAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PayoutAccountController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: const Text('Add Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroVisualization(),
            const SizedBox(height: 32),
            const Text('SELECT PAYOUT METHOD', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const SizedBox(height: 16),
            _buildMethodSelection(controller),
            const SizedBox(height: 32),
            _buildInputFields(controller),
            const SizedBox(height: 32),
            _buildVerificationPolicy(),
            const SizedBox(height: 48),
            Obx(() => AppButton(
              text: 'Save Account',
              isLoading: controller.isLoading.value,
              onPressed: controller.saveAccount,
              isGradient: true,
            )),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'By clicking save, you agree to our Financial Services Agreement.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroVisualization() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDiJk4SGZz4q-QUY1pg4rYNhe7UNLl8xuS5EGyOxZLyvSsa6x8-f4vABm-MIwQuTCDUMH9Bjh9onvHy9-ZLkafV4qeGqhR5pS_A386vwD7RccA0RODb9XJN5IQzvVrlTv5xXd4g18JSks5U3vq_E7kWWLE7ji64LsJlNBZ_9wW373yjibVBt2SXZC-KYtkGAX9VH8jO5m55OV2PPiLAhGZUiX6ZUd2KhgXTiO0PfCVHsEnaOuBDMEz99vOyLXtPOy8alRWbyoQpbw'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SECURE PAYOUTS'.toUpperCase(), style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            const Text('Digital Assets Vault', style: TextStyle(color: AppColors.onSurface, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -1.0)),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodSelection(PayoutAccountController controller) {
    return Row(
      children: [
        _buildMethodCard(controller, 'JazzCash', 'Mobile Wallet', Icons.account_balance_wallet),
        const SizedBox(width: 12),
        _buildMethodCard(controller, 'EasyPaisa', 'Instant Payout', Icons.payments),
        const SizedBox(width: 12),
        _buildMethodCard(controller, 'Crypto', 'Global Reach', Icons.currency_bitcoin),
      ],
    );
  }

  Widget _buildMethodCard(PayoutAccountController controller, String name, String subtitle, IconData icon) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.selectedMethod.value == name;
        return GestureDetector(
          onTap: () => controller.selectMethod(name),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.1)),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(color: isSelected ? AppColors.primary.withOpacity(0.2) : AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(12)),
                      child: Icon(icon, color: AppColors.primary, size: 20),
                    ),
                    const SizedBox(height: 12),
                    Text(name, style: const TextStyle(color: AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(subtitle, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 9)),
                  ],
                ),
                if (isSelected)
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(radius: 8, backgroundColor: AppColors.primary, child: Icon(Icons.check, color: Colors.black, size: 10)),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildInputFields(PayoutAccountController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          AppTextField(
            label: 'Account Holder Name',
            placeholder: 'e.g. John Doe',
            controller: controller.holderNameController,
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 24),
          Obx(() => AppTextField(
            label: '${controller.selectedMethod.value} Account Number',
            placeholder: '03XX XXXXXXX',
            controller: controller.accountNumberController,
            prefixIcon: Icons.phone_iphone_outlined,
          )),
          const SizedBox(height: 12),
          Row(
            children: [
              const CircleAvatar(radius: 3, backgroundColor: AppColors.primary),
              const SizedBox(width: 8),
              const Text('VERIFIED PROVIDER DETECTED', style: TextStyle(color: AppColors.primary, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationPolicy() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), shape: BoxShape.circle),
            child: const Icon(Icons.verified_user_outlined, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Withdrawal Verification Policy', style: TextStyle(color: AppColors.primary, fontSize: 13, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(
                  'For your security, payout accounts are locked for 24 hours after being added. New accounts require a one-time SMS verification. Ensure your account name matches your registered identity.',
                  style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11, height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
