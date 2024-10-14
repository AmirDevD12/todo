import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/widgets/my_appbar.dart';
import 'package:todo/common_ui/widgets/my_button_primary.dart';
import 'package:todo/common_ui/widgets/my_loading.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/common_ui/widgets/my_text_field.dart';
import 'package:todo/core/utils/my_app_localization.dart';
import 'package:todo/features/all_task/presentation/controller/all_task_controller.dart';
import 'package:todo/features/all_task/presentation/widget/task_widget.dart';
import 'package:todo/features/new_task/presentation/controller/new_todo_controller.dart';

class NewTodoPage extends GetView<NewTodoController> {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D7EF),
      body: SafeArea(
          child: Column(
            children: [
              const MyAppbar(title: "ADD TASK", isBack: true),
              Expanded(
                child: controller.obx(
                      (state) => RefreshIndicator(
                      color: context.theme.primaryColor,
                      onRefresh: () async {
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: MySpaces.s12,
                            ),
                            MyTextField(controller: controller.titleController, label: "",hint: "Title",),
                            const SizedBox(
                              height: MySpaces.s24,
                            ),
                            MyButtonPrimary(onPress: (){
                              if(controller.titleController.text.isEmpty){
                                MySnackBar.show("error", "please fill in the todo text");
                                return;
                              }
                              controller.postNewTask();
                            }, text: "ADD",isExpand: true,)
                          ],
                        ),
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
