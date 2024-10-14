
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/core/utils/my_app_localization.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: controller.screens[controller.tabIndex.value],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(12.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: MyColors.primary,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            color: Color(0xFF012169),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: const TextStyle(
            color: Color(0xFF667085),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          items: [
            BottomNavigationBarItem(
                icon: controller.tabIndex.value == 0
                    ? const Icon(Hicons.menu_cheesesburger_bold,
                    color: MyColors.iconTask, size: 24)
                    : const Icon(Hicons.menu_cheesesburger_light_outline,
                    color: MyColors.iconTask, size: 24),
                label: "All task".tr),
            BottomNavigationBarItem(
                icon: controller.tabIndex.value == 0
                    ? const Icon(Hicons.tick_square_bold,
                    color: MyColors.iconTask, size: 24)
                    : const Icon(Hicons.tick_square_light_outline,
                    color: MyColors.iconTask, size: 24),
                label: "Completed task".tr),

          ],
        ),
      ),
    )
    );
  }
}
