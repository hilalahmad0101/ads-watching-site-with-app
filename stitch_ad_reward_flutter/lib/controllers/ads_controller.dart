import 'dart:async';
import 'package:get/get.dart';

class AdsController extends GetxController {
  final walletBalance = "\$1,240.50".obs;
  final sessionEarnings = "\$4.25".obs;
  final remainingSeconds = 25.obs;
  final progress = 0.73.obs; 
  final isRewardClaimable = false.obs;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
        progress.value = 1.0 - (remainingSeconds.value / 90.0);
      } else {
        isRewardClaimable.value = true;
        _timer?.cancel();
      }
    });
  }

  void claimReward() {
    if (isRewardClaimable.value) {
      // Logic to claim
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
