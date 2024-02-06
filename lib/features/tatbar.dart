import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class HTabBar extends StatelessWidget {
  const HTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabBarController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 60,
          elevation: 0.5,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          backgroundColor: Colors.white,
          indicatorColor: Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.bookmark), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.coffee), label: 'Wishlist'),
          ],
        ),
      ),
    );
  }
}

class TabBarController extends GetxController {
  Rx<int> selectedIndex = 0.obs;

  final screens = [
    // const HomeScreen(),
    // const StoreScreen(),
    // const WishlistScreen(),
    // const SettingsScreen(),
  ];
}