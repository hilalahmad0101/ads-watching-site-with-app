import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyTaskModel {
  final String title;
  final String description;
  final double progress;
  final String progressText;
  final String reward;
  final IconData icon;
  final bool isCompleted;

  DailyTaskModel({
    required this.title,
    this.description = "",
    required this.progress,
    required this.progressText,
    required this.reward,
    required this.icon,
    this.isCompleted = false,
  });
}

class TasksController extends GetxController {
  final level = 24.obs;
  final xp = 3240.obs;
  final dailyProgress = 0.85.obs;
  final resetsIn = "14h 22m".obs;

  final dailyTasks = <DailyTaskModel>[
    DailyTaskModel(
      title: "Watch 10 Ads",
      progress: 1.0,
      progressText: "10/10",
      reward: "CLAIM",
      icon: Icons.play_circle_fill,
      isCompleted: true,
    ),
    DailyTaskModel(
      title: "Share with 3 Friends",
      progress: 0.33,
      progressText: "1/3",
      reward: "+500 GEM",
      icon: Icons.share,
    ),
    DailyTaskModel(
      title: "Browse Shop",
      description: "Click 5 listed items",
      progress: 0.0,
      progressText: "0/5",
      reward: "+150 GEM",
      icon: Icons.shopping_basket,
    ),
  ].obs;

  void claimReward(int index) {
    // Logic to claim reward
  }
}
