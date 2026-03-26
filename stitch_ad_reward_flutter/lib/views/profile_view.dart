import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../res/colors/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          children: [
            const Text(
              'Profile Hub',
              style: TextStyle(color: AppColors.onSurface, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            _buildProfileCard(controller),
            const SizedBox(height: 32),
            _buildStatsGrid(controller),
            const SizedBox(height: 32),
            _buildMenuSection(context, controller),
            const SizedBox(height: 32),
            const Text(
              'AdReward Pro v1.0.4 - Premium Build',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(ProfileController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Obx(() => CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(controller.profileImageUrl.value),
          )),
          const SizedBox(height: 16),
          Obx(() => Text(
            controller.userName.value,
            style: const TextStyle(color: AppColors.onSurface, fontSize: 20, fontWeight: FontWeight.bold),
          )),
          const SizedBox(height: 4),
          Obx(() => Text(
            controller.userEmail.value,
            style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
          )),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Obx(() => Text(
              controller.membership.value,
              style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(ProfileController controller) {
    return Row(
      children: [
        Expanded(child: _buildStatItem("Total Assets", controller.totalAssets)),
        const SizedBox(width: 16),
        Expanded(child: _buildStatItem("Referrals", controller.referralCount.value.toString().obs)),
      ],
    );
  }

  Widget _buildStatItem(String label, RxString value) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 11, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Obx(() => Text(value.value, style: const TextStyle(color: AppColors.onSurface, fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -1.0))),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, ProfileController controller) {
    return Container(
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          _buildMenuItem(Icons.person_outline, "Personal Information", () => Get.toNamed('/personal-information')),
          _buildMenuItem(Icons.account_balance_wallet_outlined, "Wallet & Withdraw", () => Get.toNamed('/wallet-withdraw')),
          _buildMenuItem(Icons.receipt_long_outlined, "Transaction History", () => Get.toNamed('/transaction-history')),
          _buildMenuItem(Icons.groups_outlined, "Referral Network", () => Get.toNamed('/referrals')),
          _buildMenuItem(Icons.logout, "Developer Logout", controller.logout, isLast: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap, {bool isLast = false}) {
    return ListTile(
      leading: Icon(icon, color: label == "Developer Logout" ? Colors.redAccent : AppColors.primary, size: 22),
      title: Text(label, style: TextStyle(color: label == "Developer Logout" ? Colors.redAccent : AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.surfaceContainerHighest, size: 20),
      onTap: onTap,
      shape: !isLast ? const Border(bottom: BorderSide(color: AppColors.surfaceContainerHighest, width: 0.5)) : null,
    );
  }
}
