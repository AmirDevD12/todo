import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/all_task/presentation/page/all_task_page.dart';
import 'package:todo/features/completed_todo/presentation/binding/completed_todo_binding.dart';
import 'package:todo/features/completed_todo/presentation/page/completed_todo_page.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeController();

  var tabIndex = 0.obs;

  RxList<Widget> screens = RxList<Widget>([]);

  @override
  Future<void> onInit() async {
    screens.value = [const AllTaskPage(), const CompletedTodoPage()];
    super.onInit();
  }

  Future<void> changeTabIndex(int index) async {
    switch (index) {
      case 1:
        CompletedTodoBinding().refreshPage();
        break;
      case 0:
        AllTaskBinding().refreshPage();
        break;
    }
    tabIndex.value = index;
  }
}
