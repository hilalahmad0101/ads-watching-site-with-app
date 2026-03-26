import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/colors/app_colors.dart';

class TransactionHistoryController extends GetxController {
  final balance = 12480.00.obs;
  final filter = 'All'.obs;

  final transactions = <TransactionHistoryModel>[
    TransactionHistoryModel(
      title: 'Ad Revenue Share',
      date: 'May 24, 2024 • 14:20',
      amount: '+ \$450.00',
      status: 'Earned',
      icon: Icons.trending_up,
      color: AppColors.primary,
    ),
    TransactionHistoryModel(
      title: 'Task Completion Bonus',
      date: 'May 23, 2024 • 09:15',
      amount: '+ \$1,200.00',
      status: 'Pending',
      icon: Icons.schedule,
      color: Colors.yellowAccent,
    ),
    TransactionHistoryModel(
      title: 'External Wallet Payout',
      date: 'May 22, 2024 • 18:45',
      amount: '- \$2,500.00',
      status: 'Withdrawn',
      icon: Icons.outbound,
      isNegative: true,
      color: AppColors.onSurface,
    ),
    TransactionHistoryModel(
      title: 'Referral Commission',
      date: 'May 21, 2024 • 11:30',
      amount: '+ \$75.00',
      status: 'Earned',
      icon: Icons.redeem,
      color: AppColors.primary,
    ),
  ].obs;

  void setFilter(String val) {
    filter.value = val;
    // Logic to filter the actual list
  }
}

class TransactionHistoryModel {
  final String title;
  final String date;
  final String amount;
  final String status;
  final IconData icon;
  final bool isNegative;
  final Color color;

  TransactionHistoryModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
    required this.icon,
    this.isNegative = false,
    required this.color,
  });
}

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionHistoryController());
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: const Text('Transactions'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: AppColors.primary)),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBentoBalance(controller),
            const SizedBox(height: 32),
            _buildFilters(controller),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Activity', style: TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.bold)),
                const Text('May 2024', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.transactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final transaction = controller.transactions[index];
                return _buildTransactionItem(transaction);
              },
            )),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildBentoBalance(TransactionHistoryController controller) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primary.withOpacity(0.05)),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            child: Opacity(
              opacity: 0.1,
              child: Icon(Icons.account_balance_wallet, size: 100, color: AppColors.primary),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('AVAILABLE BALANCE', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              const SizedBox(height: 12),
              Obx(() => Text('\$${controller.balance.value.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.onSurface, fontSize: 40, fontWeight: FontWeight.w900, letterSpacing: -2.0))),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircleAvatar(radius: 4, backgroundColor: AppColors.primary),
                  const SizedBox(width: 8),
                  const Text('Real-time updates active', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(TransactionHistoryController controller) {
    final filters = ['All', 'Earned', 'Withdrawn', 'Pending'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((f) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Obx(() {
              final isSelected = controller.filter.value == f;
              return ChoiceChip(
                label: Text(f, style: TextStyle(color: isSelected ? Colors.black : AppColors.onSurfaceVariant, fontSize: 12, fontWeight: FontWeight.bold)),
                selected: isSelected,
                onSelected: (val) => controller.setFilter(f),
                selectedColor: AppColors.primary,
                backgroundColor: AppColors.surfaceContainerLow,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                showCheckmark: false,
              );
            }),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTransactionItem(TransactionHistoryModel item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(12)),
            child: Icon(item.icon, color: item.color, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title, style: const TextStyle(color: AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.bold)),
                Text(item.date, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(item.amount, style: TextStyle(color: item.color, fontSize: 15, fontWeight: FontWeight.w900)),
              Text(item.status.toUpperCase(), style: TextStyle(color: item.color.withOpacity(0.6), fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
            ],
          ),
        ],
      ),
    );
  }
}
