import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_view.dart';
import 'tasks_view.dart';
import 'ads_view.dart';
import 'wallet_view.dart';
import 'profile_view.dart';
import '../widgets/app_nav_bar.dart';

class MainLayoutController extends GetxController {
  final currentIndex = 0.obs;
  
  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainLayoutController());
    
    final List<Widget> pages = [
      const HomeView(),
      const TasksView(),
      const AdsView(),
      const WalletView(),
      const ProfileView(),
    ];

    return Scaffold(
      extendBody: true,
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(() => AppNavBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeIndex,
      )),
    );
  }
}
