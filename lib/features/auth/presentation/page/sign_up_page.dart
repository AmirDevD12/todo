import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';
import 'package:todo/common_ui/widgets/my_button_primary.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/common_ui/widgets/my_text_field.dart';
import 'package:todo/common_ui/widgets/my_vector_background.dart';
import 'package:todo/features/auth/presentation/controller/auth_controller.dart';
import 'package:todo/features/auth/presentation/widget/auth_text_field.dart';
import 'package:todo/features/auth/presentation/widget/or_contact_with.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const MyVectorBackground(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "Sign Up",
                        style: TextBoldStyle.lg
                            .copyWith(color: Colors.white, fontSize: 40),
                      ))
                    ],
                  ),
                  AuthTextField(
                    hint: "Email",
                    leftIcon: Icons.email_outlined,
                    onChanged: (value) {
                      controller.emailController.text = value;
                    },
                    controller: controller.emailController,
                    label: '',
                  ),
                  AuthTextField(
                    isPassword: true,
                    isHidePassword: true,
                    hint: "Password",
                    leftIcon: Hicons.password_3_light_outline,
                    onChanged: (value) {
                      controller.passwordController.text = value;
                    },
                    controller: controller.passwordController,
                    label: '',
                  ),
                  AuthTextField(
                    hint: "Confirm Password",
                    leftIcon: Icons.check,
                    onChanged: (value) {
                      controller.confirmController.text = value;
                    },
                    controller: controller.confirmController,
                    label: '',
                  ),
                  const SizedBox(height: 20),
                  MyButtonPrimary(
                    background: const Color(0xFF6A74CF),
                    isExpand: true,
                    onPress: () {
                      if (controller.passwordController.text == "") {
                        MySnackBar.show("error", "password is empty");
                        return;
                      }
                      if (controller.emailController.text == "") {
                        MySnackBar.show("error", "email is empty");
                        return;
                      }
                      if (controller.confirmController.text == "") {
                        MySnackBar.show("error", "confirm is empty");
                        return;
                      }
                      if (controller.confirmController.text !=
                          controller.passwordController.text) {
                        MySnackBar.show(
                            "error", "please correct confirm password");
                        return;
                      }
                      controller.signUp();
                    },
                    text: 'Sign Up',
                  ).marginSymmetric(
                      horizontal: MySpaces.s32, vertical: MySpaces.s24),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        textAlign: TextAlign.center,
                        "or connect with",
                        style: TextBoldStyle.xs.copyWith(
                          color: Color(0xff7A7A7A),
                        ),
                      ))
                    ],
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: OrContactWith(
                        text: "FaceBook",
                        icon: Icons.facebook_outlined,
                        background: Color(0xFF35A6EF),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: OrContactWith(
                        text: "Twiter",
                        icon: Icons.email_outlined,
                        background: Color(0xFF5073B5),
                      ))
                    ],
                  ).paddingSymmetric(horizontal: 20, vertical: 20),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                        child: Text(
                          "Do you have account? Login",
                          textAlign: TextAlign.center,
                          style: TextBoldStyle.xs.copyWith(
                            color: const Color(0xff7A7A7A),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
