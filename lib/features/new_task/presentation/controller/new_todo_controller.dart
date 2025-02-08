import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/new_task/domain/usecases/all_task_usecases.dart';

class NewTodoController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  final NewTodoComponents getNewTodoComponents;

  NewTodoController({required this.getNewTodoComponents});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Future<void> onInit() async {
    change("", status: RxStatus.success());
    super.onInit();
  }

  void postNewTask() {
    change(null, status: RxStatus.loading());
    getNewTodoComponents(
            NewTodoParams(todo: titleController.text, completed: false))
        .then((value) => value.fold(
            (Failure? failure) => getUpdateFailedResult(failure!),
            (result) => postNewTaskSuccessResult(result)));
  }

  getUpdateFailedResult(Failure failure) {
    MySnackBar.show(failure.header.toString(), failure.body.toString());
    change(failure.body.toString(), status: RxStatus.error());
  }

  postNewTaskSuccessResult(result) {
    change("", status: RxStatus.success());
    AllTaskBinding();
    Get.back();
  }
}
