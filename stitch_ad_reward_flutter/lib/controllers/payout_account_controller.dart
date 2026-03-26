import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayoutAccountController extends GetxController {
  final holderNameController = TextEditingController();
  final accountNumberController = TextEditingController();
  
  final selectedMethod = 'EasyPaisa'.obs;
  final isLoading = false.obs;

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  Future<void> saveAccount() async {
    if (holderNameController.text.isEmpty || accountNumberController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white);
      return;
    }

    isLoading.value = true;
    // Simulate API call
    await 1.delay();
    isLoading.value = false;

    Get.snackbar('Success', 'Payout account added successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color(0xFF62df7d),
      colorText: Colors.black);
    
    Get.back();
  }

  @override
  void onClose() {
    holderNameController.dispose();
    accountNumberController.dispose();
    super.onClose();
  }
}
