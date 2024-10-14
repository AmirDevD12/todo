
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/all_task/presentation/page/all_task_page.dart';
import 'package:todo/features/home/presentation/binding/home_page_binding.dart';
import 'package:todo/features/home/presentation/page/home_page.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  HomeController();

  var tabIndex = 0.obs;


  RxList<Widget> screens = RxList<Widget>([]);


  @override
  Future<void> onInit() async {
    screens.value=[
      const AllTaskPage(),

    ];
    super.onInit();
  }


  Future<void> changeTabIndex(int index) async {
    switch (index) {
      case 1:
        // ChatListPageBindings().refreshPage();
        break;
      case 0:
        AllTaskBinding().refreshPage();
        break;
      case 3:
        // MapPageBindings().refreshPage();
        break;
      case 4:
        break;
    }
    tabIndex.value = index;
  }


}
