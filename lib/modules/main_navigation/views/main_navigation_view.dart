import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../controllers/main_navigation_controller.dart';
import '../../home/views/home_view.dart';
import '../../services/views/services_view.dart';
import '../../projects/views/projects_view.dart';
import '../../more/views/more_view.dart';

class MainNavigationView extends GetView<MainNavigationController> {
  const MainNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = const [
      HomeView(),
      ServicesView(),
      ProjectsView(),
      MoreView(),
    ];

    return Obx(
      () => Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.textMuted,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 8,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined),
              activeIcon: const Icon(Icons.home_rounded),
              label: 'tab_home'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.business_center_outlined),
              activeIcon: const Icon(Icons.business_center_rounded),
              label: 'tab_services'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.apartment_outlined),
              activeIcon: const Icon(Icons.apartment_rounded),
              label: 'tab_projects'.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.grid_view_outlined),
              activeIcon: const Icon(Icons.grid_view_rounded),
              label: 'tab_more'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
