import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/wallet_controller.dart';
import '../res/colors/app_colors.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WalletController());
    
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Emerald Wallet',
              style: TextStyle(color: AppColors.onSurface, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Manage your earnings and withdraw to your preferred accounts.',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14),
            ),
            const SizedBox(height: 32),
            _buildBalanceCard(controller),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Activity', style: TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () => Get.toNamed('/transaction-history'),
                  child: const Text('See All', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.recentTransactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final transaction = controller.recentTransactions[index];
                return _buildTransactionCard(transaction);
              },
            )),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(WalletController controller) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text('TOTAL BALANCE', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          Obx(() => Text(
            '\$${controller.availableBalance.value}',
            style: const TextStyle(color: AppColors.primary, fontSize: 44, fontWeight: FontWeight.w900, letterSpacing: -2.0),
          )),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: _buildActionBtn(Icons.arrow_downward_rounded, "Top Up", onTap: () {}),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildActionBtn(Icons.arrow_upward_rounded, "Withdraw", isPrimary: true, onTap: () => Get.toNamed('/wallet-withdraw')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(IconData icon, String label, {bool isPrimary = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primary : AppColors.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isPrimary ? Colors.black : AppColors.onSurface, size: 20),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: isPrimary ? Colors.black : AppColors.onSurface, fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionCard(TransactionModel transaction) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: AppColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(12)),
            child: Icon(transaction.icon, color: transaction.isNegative ? Colors.orange : AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title, style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                Text(transaction.date, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(transaction.amount, style: TextStyle(color: transaction.isNegative ? Colors.orange : AppColors.primary, fontWeight: FontWeight.bold)),
              Text(transaction.status, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
