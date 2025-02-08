import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/edite_todo/domain/usecases/edite_todo_usecases.dart';

class EditeTodoController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  final EditeTodoComponents getEditeTodoComponents;

  EditeTodoController({
    required this.getEditeTodoComponents,
  });

  final TextEditingController titleController = TextEditingController();
  RxBool completed = false.obs;
  @override
  void onInit() {
    titleController.text = Get.arguments["title"];
     change("", status: RxStatus.success());

     super.onInit();
  }

  void getEditeTask() {
    change(null, status: RxStatus.loading());
    getEditeTodoComponents(EditeTodoParams(completed: completed.value, id: Get.arguments["id"]!)).then(
        (value) => value.fold(
            (Failure? failure) => getUpdateFailedResult(failure!),
            (result) => getEditeTodoSuccessResult(result)));
  }

  getEditeTodoSuccessResult(result) {
    change("", status: RxStatus.success());
    Get.back();
    MySnackBar.show("Success", "edite todo success");
    AllTaskBinding().dependencies();
  }

  getUpdateFailedResult(Failure failure) {
    MySnackBar.show(failure.header.toString(), failure.body.toString());
    change(failure.body.toString(), status: RxStatus.error());
  }
}
