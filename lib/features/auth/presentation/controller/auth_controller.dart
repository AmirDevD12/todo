import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/auth_service/auth_service.dart';
import 'package:todo/core/routers/routes.dart';

class AuthController extends GetxController with GetSingleTickerProviderStateMixin {
  RxBool isLoading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }


  void login() async {
    try{
      await authService.signInWithEmailPassword(emailController.text, passwordController.text).then((user){
        Get.offAllNamed(Routes.home);
      });
    }
    catch (e) {
      MySnackBar.show("error", e.toString());
    }
  }
  void signUp() async {
    try{
      await authService.signUpWithEmailPassword(emailController.text, passwordController.text).then((user){
        Get.offAllNamed(Routes.home);
      });
    }
    catch (e) {
      MySnackBar.show("error", e.toString());
    }
  }

}
