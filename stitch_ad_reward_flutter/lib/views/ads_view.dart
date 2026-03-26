import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/ads_controller.dart';
import '../res/colors/app_colors.dart';
import '../widgets/app_button.dart';

class AdsView extends StatefulWidget {
  const AdsView({super.key});

  @override
  State<AdsView> createState() => _AdsViewState();
}

class _AdsViewState extends State<AdsView> {
  final controller = Get.put(AdsController());

  @override
  void initState() {
    super.initState();
    controller.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie_filter_rounded, size: 80, color: AppColors.primary),
            const SizedBox(height: 32),
            const Text(
              'Premium Ad Session',
              style: TextStyle(color: AppColors.onSurface, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Do not close the app to ensure your reward is credited.',
              style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Obx(() => CircularProgressIndicator(
                    value: controller.progress.value,
                    strokeWidth: 12,
                    backgroundColor: AppColors.surfaceContainerHigh,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  )),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Text(
                      '${controller.remainingSeconds.value}',
                      style: const TextStyle(color: AppColors.onSurface, fontSize: 48, fontWeight: FontWeight.w900, letterSpacing: -2.0),
                    )),
                    const Text('SECONDS LEFT', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80),
            Obx(() => AppButton(
              text: controller.isRewardClaimable.value ? 'Claim Reward' : 'Watching Ad...',
              onPressed: controller.claimReward,
              isGradient: controller.isRewardClaimable.value,
            )),
          ],
        ),
      ),
    );
  }
}
