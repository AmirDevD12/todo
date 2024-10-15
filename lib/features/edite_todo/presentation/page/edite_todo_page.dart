import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/widgets/my_appbar.dart';
import 'package:todo/common_ui/widgets/my_button_primary.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/common_ui/widgets/my_text_field.dart';
import 'package:todo/features/edite_todo/presentation/controller/edite_todo_controller.dart';

class EditeTodoPage extends GetView<EditeTodoController> {
  const EditeTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D7EF),
      body: SafeArea(
          child: Column(
            children: [
              const MyAppbar(title: "EDITE TODO", isBack: true),
              Expanded(
                child: controller.obx(
                      (state) => RefreshIndicator(
                      color: context.theme.primaryColor,
                      onRefresh: () async {
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: MySpaces.s12,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Expanded(child: MyTextField(controller: controller.titleController, label: "",readOnly: true,rightWidget:  Obx(
                                    ()=> Checkbox(
                                  value: controller.completed.value,
                                  onChanged: (bool? newValue) {
                                    controller.completed.value = newValue!;
                                  },
                                ),
                              ) ,)),

                            ],
                          ),
                          const SizedBox(
                            height: MySpaces.s24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: MyButtonPrimary(onPress: (){
                                  Get.back();
                                }, text: "CANCEL",),
                              ),
                              const SizedBox(width: MySpaces.s20,),
                              Expanded(
                                child: MyButtonPrimary(onPress: (){
                                 if(!controller.completed.value){
                                   MySnackBar.show("error", "please completed todo");
                                   return;
                                 }
                                 controller.getEditeTask();

                                }, text: "UPDATE",),
                              ),

                            ],
                          )
                        ],
                      )
                  ),
                  onLoading: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  onEmpty: const SizedBox.shrink(),
                  onError: (error) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(error.toString()),
                          const SizedBox(
                            height: MySpaces.s12,
                          ),
                          IconButton(
                              onPressed: () {
                              },
                              icon: const Icon(Hicons.refresh_1_light_outline))
                        ],
                      ),
                    ],
                  ),
                ).marginOnly(
                    top: MySpaces.s20, left: MySpaces.s20, right: MySpaces.s20, bottom: MySpaces.s20),
              ),
            ],
          )
      ),
    );
  }
}
