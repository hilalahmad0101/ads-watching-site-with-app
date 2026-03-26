import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskModel {
  final String title;
  final String payout;
  final String progressLabel;
  final String statusLabel;
  final double progress;
  final IconData icon;

  TaskModel({
    required this.title,
    required this.payout,
    required this.progressLabel,
    required this.statusLabel,
    required this.progress,
    required this.icon,
  });
}

class HomeController extends GetxController {
  final userName = "Alex".obs;
  final totalBalance = "\$4,201.00".obs;
  final todayEarnings = "\$12.50".obs;
  final activeTasksCount = 8.obs;
  final todayProgress = 0.65.obs;
  
  final featuredTasks = <TaskModel>[
    TaskModel(
      title: "Watch Premium Ads",
      payout: "\$2.40",
      progressLabel: "15/20 Completed",
      statusLabel: "High Priority",
      progress: 0.75,
      icon: Icons.movie_filter,
    ),
    TaskModel(
      title: "App Performance Survey",
      payout: "\$5.00",
      progressLabel: "1/3 Questions",
      statusLabel: "Expires in 2h",
      progress: 0.3,
      icon: Icons.rate_review,
    ),
    TaskModel(
      title: "Social Network Share",
      payout: "\$0.50",
      progressLabel: "0/1 Shared",
      statusLabel: "Instant Payout",
      progress: 0.0,
      icon: Icons.share,
    ),
  ].obs;

  void refreshDashboard() {
    // Logic to refresh data from API
  }
}
