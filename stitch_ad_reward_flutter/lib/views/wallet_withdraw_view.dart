import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/withdraw_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';

class WalletWithdrawView extends StatelessWidget {
  const WalletWithdrawView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(WithdrawController());
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: const Text('Wallet & Withdraw'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Center(
              child: Text(
                'LEDGER',
                style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: -1.0),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceCard(controller),
            const SizedBox(height: 32),
            const Text('Withdraw Amount', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
            const SizedBox(height: 16),
            _buildAmountInput(controller),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Network Fee (2.5%)', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
                Obx(() => Text('\$${controller.feeAmount.value.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.onSurface, fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Select Method', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                TextButton(
                  onPressed: () => Get.toNamed('/add-payout-account'), 
                  child: const Text('Manage', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildMethodOption(controller, 'JazzCash', '0345 •••• 123', Icons.account_balance_wallet),
            const SizedBox(height: 12),
            _buildMethodOption(controller, 'EasyPaisa', '0300 •••• 987', Icons.payments),
            const SizedBox(height: 12),
            _buildMethodOption(controller, 'Crypto Wallet', 'TRX / USDT (BEP20)', Icons.currency_bitcoin),
            const SizedBox(height: 48),
            AppButton(
              text: 'Withdraw Funds',
              onPressed: controller.withdrawFunds,
              isGradient: true,
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'FUNDS TYPICALLY ARRIVE WITHIN 24-48 HOURS.\nPLEASE VERIFY YOUR WALLET ADDRESS BEFORE CONFIRMING.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.2, height: 1.5),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard(WithdrawController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('AVAILABLE BALANCE', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                child: const Row(
                  children: [
                    CircleAvatar(radius: 3, backgroundColor: AppColors.primary),
                    SizedBox(width: 6),
                    Text('LIVE', style: TextStyle(color: AppColors.primary, fontSize: 8, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Obx(() => Text('\$${controller.availableBalance.value.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.primary, fontSize: 44, fontWeight: FontWeight.w900, letterSpacing: -2.0))),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: _buildSubStat("Total Earned", controller.totalEarned.value.toStringAsFixed(2))),
              const SizedBox(width: 16),
              Expanded(child: _buildSubStat("Pending", controller.pendingAmount.value.toStringAsFixed(2))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubStat(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 8, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text('\$$value', style: const TextStyle(color: AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAmountInput(WithdrawController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const Text('\$', style: TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: controller.amountController,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: AppColors.onSurface, fontSize: 24, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(border: InputBorder.none, hintText: '0.00', hintStyle: TextStyle(color: Colors.grey)),
            ),
          ),
          ElevatedButton(
            onPressed: controller.setMax,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.surfaceContainerHighest,
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('MAX', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodOption(WithdrawController controller, String name, String subtitle, IconData icon) {
    return Obx(() {
      final isSelected = controller.selectedMethod.value == name;
      return GestureDetector(
        onTap: () => controller.selectedMethod.value = name,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary.withOpacity(0.05) : AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: isSelected ? AppColors.primary.withOpacity(0.3) : Colors.transparent),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(10)),
                child: Icon(icon, color: AppColors.primary),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(subtitle, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant.withOpacity(0.3), width: 2),
                ),
                child: isSelected ? const Center(child: CircleAvatar(radius: 5, backgroundColor: AppColors.primary)) : null,
              ),
            ],
          ),
        ),
      );
    });
  }
}
