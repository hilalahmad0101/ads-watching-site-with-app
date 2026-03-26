import 'package:flutter/material.dart';
import 'dart:async';

class AdsViewModel extends ChangeNotifier {
  String walletBalance = "\$1,240.50";
  String sessionEarnings = "\$4.25";
  int remainingSeconds = 25;
  double progress = 0.73; // 1 - (25/90) roughly
  bool isRewardClaimable = false;
  Timer? _timer;

  void startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        progress = 1.0 - (remainingSeconds / 90.0); // Assume 90s total
        notifyListeners();
      } else {
        isRewardClaimable = true;
        _timer?.cancel();
        notifyListeners();
      }
    });
  }

  void claimReward() {
    if (isRewardClaimable) {
      // Logic to claim
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
