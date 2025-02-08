import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/resource/my_colors.dart';
import 'package:todo/common_ui/resource/my_spaces.dart';
import 'package:todo/common_ui/widgets/my_appbar.dart';
import 'package:todo/core/routers/routes.dart';
import 'package:todo/features/all_task/presentation/controller/all_task_controller.dart';
import 'package:todo/features/all_task/presentation/widget/task_widget.dart';

class AllTaskPage extends GetView<AllTaskController> {
  const AllTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD6D7EF),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.newToDo);
        },
        backgroundColor: MyColors.primaryColor,
        child: const Icon(
          Hicons.add_bold,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const MyAppbar(title: "TODO APP", isBack: false),
          Expanded(
            child: controller
                .obx(
                  (state) => Column(
                    children: [
                      const SizedBox(
                        height: MySpaces.s12,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(
                            height: MySpaces.s12,
                          ),
                          itemCount: controller.allTask!.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final data = controller.allTask![index];
                            return ItemTask(
                              data: data,
                              onTapDelete: (data) {
                                controller.getDeleteTask(id: data.id ?? 0);
                              },
                              onTapEdite: (data) {
                                Get.toNamed(Routes.editeTodo,
                                    arguments: {"title": data.todo ?? "","id":data.id??0});
                              },
                            );
                          },
                        ),
                      )
                    ],
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
                          IconButton(
                              onPressed: () {
                                controller.getAllTask();
                              },
                              icon: const Icon(Hicons.refresh_1_light_outline))
                        ],
                      ),
                    ],
                  ),
                )
                .marginOnly(
                  top: MySpaces.s20,
                  left: MySpaces.s20,
                  right: MySpaces.s20,
                ),
          ),
        ],
      )),
    );
  }
}
