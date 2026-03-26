import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionModel {
  final String title;
  final String date;
  final String amount;
  final String status;
  final IconData icon;
  final bool isNegative;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.status,
    required this.icon,
    this.isNegative = false,
  });
}

class WalletController extends GetxController {
  final availableBalance = "1,482.50".obs;
  
  final recentTransactions = <TransactionModel>[
    TransactionModel(
      title: "Ad Reward Bonus",
      date: "Today, 2:45 PM",
      amount: "+\$12.50",
      status: "APPROVED",
      icon: Icons.ads_click,
    ),
    TransactionModel(
      title: "Withdraw to Crypto",
      date: "Yesterday, 9:12 AM",
      amount: "-\$250.00",
      status: "PENDING",
      icon: Icons.outbox,
      isNegative: true,
    ),
    TransactionModel(
      title: "Video Ad Series #4",
      date: "Oct 24, 2023",
      amount: "+\$4.20",
      status: "APPROVED",
      icon: Icons.videocam,
    ),
  ].obs;

  void withdraw() {
    // Logic for withdrawal
  }
}
