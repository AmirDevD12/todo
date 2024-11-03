import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/auth_service/auth_service.dart';
import 'package:todo/core/routers/routes.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/all_task/presentation/page/all_task_page.dart';
import 'package:todo/features/completed_todo/presentation/binding/completed_todo_binding.dart';
import 'package:todo/features/completed_todo/presentation/page/completed_todo_page.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  HomeController();
  final AuthService authService = AuthService();
  var tabIndex = 0.obs;

  RxList<Widget> screens = RxList<Widget>([]);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<void> onInit() async {

    _auth.authStateChanges().listen((User? user){
      if(user==null){
        Get.offAllNamed(Routes.loginPage);
        return;
      }
    });
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
  void signOut() async {
    try{
      await authService.signOut();
    }
    catch (e) {
      MySnackBar.show("error", e.toString());
    }
  }
}
