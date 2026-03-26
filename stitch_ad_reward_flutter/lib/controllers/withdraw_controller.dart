import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawController extends GetxController {
  final availableBalance = 1284.50.obs;
  final totalEarned = 4120.00.obs;
  final pendingAmount = 145.20.obs;
  
  final amountController = TextEditingController();
  final selectedMethod = 'JazzCash'.obs;
  
  final feePercentage = 0.025;
  final feeAmount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    amountController.addListener(_calculateFee);
  }

  void _calculateFee() {
    double amount = double.tryParse(amountController.text) ?? 0.0;
    feeAmount.value = amount * feePercentage;
  }

  void setMax() {
    amountController.text = availableBalance.value.toString();
    _calculateFee();
  }

  Future<void> withdrawFunds() async {
    if (amountController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter an amount');
      return;
    }
    
    Get.snackbar('Success', 'Withdrawal request submitted successfully!');
    await 1.delay();
    Get.back();
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
