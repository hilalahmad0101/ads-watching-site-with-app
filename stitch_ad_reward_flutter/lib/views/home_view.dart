import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../res/colors/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(controller),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  _buildBalanceCard(controller),
                  const SizedBox(height: 32),
                  _buildSectionHeader("Featured Tasks", "View All"),
                  const SizedBox(height: 16),
                  Obx(() => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.featuredTasks.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = controller.featuredTasks[index];
                      return _buildTaskCard(task);
                    },
                  )),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(HomeController controller) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(32)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://placeholder.com/150'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Welcome back,', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12)),
                  Obx(() => Text(controller.userName.value, style: const TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded, color: AppColors.onSurface),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(HomeController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryContainer.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('AVAILABLE BALANCE', style: TextStyle(color: AppColors.onPrimary, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          Obx(() => Text(controller.totalBalance.value, style: const TextStyle(color: AppColors.onPrimary, fontSize: 36, fontWeight: FontWeight.w900))),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Today\'s Global Rank', style: TextStyle(color: AppColors.onPrimary, fontSize: 11)),
                  const Text('#4,129', style: TextStyle(color: AppColors.onPrimary, fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Daily Goal', style: TextStyle(color: AppColors.onPrimary, fontSize: 11)),
                  Obx(() => Text('${(controller.todayProgress.value * 100).toInt()}%', style: const TextStyle(color: AppColors.onPrimary, fontSize: 16, fontWeight: FontWeight.bold))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(action, style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTaskCard(task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onSurfaceVariant.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(task.icon, color: AppColors.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: const TextStyle(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                Text(task.payout, style: const TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant),
        ],
      ),
    );
  }
}
