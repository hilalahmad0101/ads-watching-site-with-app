import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/referral_controller.dart';
import '../res/colors/app_colors.dart';

class ReferralView extends StatelessWidget {
  const ReferralView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReferralController());
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
        ),
        title: const Text('Referral Network'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCodeCard(controller),
            const SizedBox(height: 32),
            const Text(
              'Network Hierarchy',
              style: TextStyle(color: AppColors.onSurface, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildHierarchyItem("Tier 1", controller.tierStats["Tier 1"].toString().obs, "Direct", AppColors.primary),
                const SizedBox(width: 12),
                _buildHierarchyItem("Tier 2", controller.tierStats["Tier 2"].toString().obs, "Indirect", AppColors.primaryContainer),
                const SizedBox(width: 12),
                _buildHierarchyItem("Tier 3", controller.tierStats["Tier 3"].toString().obs, "Extended", AppColors.onSurfaceVariant),
              ],
            ),
            const SizedBox(height: 32),
            _buildRevenueCard(controller),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recent Connections', style: TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('See All', style: TextStyle(color: AppColors.primary, fontSize: 12, fontWeight: FontWeight.bold))),
              ],
            ),
            const SizedBox(height: 8),
            Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.recentReferrals.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final referral = controller.recentReferrals[index];
                return _buildReferralCard(referral);
              },
            )),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeCard(ReferralController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Unique Link'.toUpperCase(), style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0)),
              Row(
                children: [
                  Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                  const SizedBox(width: 6),
                  const Text('Active Bonus', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: AppColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Expanded(child: Obx(() => Text(controller.referralCode.value, style: const TextStyle(color: AppColors.primary, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'monospace')))),
                ElevatedButton(onPressed: () {}, child: const Text('Copy', style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              text: 'Earn up to ',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 12),
              children: [
                TextSpan(text: '15% commission', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
                TextSpan(text: ' from all direct referral activities and secondary tiers.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHierarchyItem(String title, RxString count, String label, Color accentColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border(left: BorderSide(color: accentColor, width: 4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.toUpperCase(), style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 8, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Obx(() => Text(count.value, style: const TextStyle(color: AppColors.onSurface, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: -1.0))),
            Text(label, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 9, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueCard(ReferralController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: AppColors.surfaceContainer, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Network Revenue'.toUpperCase(), style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold)),
                  Obx(() => Text(controller.totalNetworkRevenue.value, style: const TextStyle(color: AppColors.primary, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1.0))),
                ],
              ),
              Obx(() => Text(controller.growthPercentage.value, style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReferralCard(ReferralModel referral) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(referral.imageUrl)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(referral.name, style: const TextStyle(color: AppColors.onSurface, fontSize: 14, fontWeight: FontWeight.bold)),
                Text(referral.tier, style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(referral.amount, style: const TextStyle(color: AppColors.primary, fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
