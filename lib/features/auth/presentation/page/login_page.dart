import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/resource/my_text_styles.dart';
import 'package:todo/common_ui/widgets/my_button_primary.dart';
import 'package:todo/common_ui/widgets/my_vector_background.dart';
import 'package:todo/core/routers/routes.dart';
import 'package:todo/features/auth/presentation/controller/auth_controller.dart';
import 'package:todo/features/auth/presentation/widget/auth_text_field.dart';
import 'package:todo/features/auth/presentation/widget/or_contact_with.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const MyVectorBackground(),
           Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                          textAlign: TextAlign.center,
                          "Login",
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
                      isPassword: true,isHidePassword: true,
                      hint: "Password",
                      leftIcon: Hicons.password_3_light_outline,
                      onChanged: (value) {
                        controller.passwordController.text = value;
                      },
                      controller: controller.passwordController,
                      label: '',
                    ),
                    const SizedBox(height: 60),
                    MyButtonPrimary(
                      background: const Color(0xFF6A74CF),
                      isExpand: true,
                      onPress: controller.login,
                      text: 'Login',
                    ).marginSymmetric(horizontal: MySpaces.s32,vertical: MySpaces.s24),
                    Row(
                      children: [
                        Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              "?Forgot your password",
                              style: TextBoldStyle.xs
                                  .copyWith(color: Colors.white,),
                            ))
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        SizedBox(width: 10,),
                        Expanded(
                            child: OrContactWith(
                          text: "Twiter",
                          icon: Icons.email_outlined,
                          background: Color(0xFF5073B5),
                        ))
                      ],
                    ).paddingSymmetric(horizontal: 20,vertical: 20),
                     Row(
                      children: [
                        Expanded(child: GestureDetector(
                          onTap: (){
                            controller.emailController.text = "";
                            controller.passwordController.text = "";
                            Get.toNamed(Routes.signUpPage);
                          },
                          child: Text("Don’t have account? SignUp",textAlign: TextAlign.center,      style: TextBoldStyle.xs.copyWith(
                            color: const Color(0xff7A7A7A),
                          ),),
                        ))
                      ],
                    )
                  ],
                )
              ],
            )

        ],
      ),
    );
  }
}
