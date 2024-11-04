import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_bottom_shit.dart';
import 'package:todo/common_ui/widgets/my_error_network.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/check_connectivity/check_connectivity_service.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/request_pending/my_request_pending_service.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/all_task/domain/usecases/all_task_usecases.dart';
import 'package:todo/features/all_task/domain/usecases/delete_todo_usecas.dart';

class AllTaskController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  final AllTaskComponents getAllTaskComponents;
  final DeleteTodoComponents getDeleteTodoComponents;

  AllTaskController(
      {required this.getAllTaskComponents,
      required this.getDeleteTodoComponents});

  RxList<TodoEntity>? allTask = RxList();

  @override
  Future<void> onInit() async {
    getAllTask();
    getAllTask();
    getAllTask();
    super.onInit();
  }

  getAllTask() {
    change(null, status: RxStatus.loading());
    getAllTaskComponents(NoParams()).then((value) => value.fold(
        (Failure? failure) => getUpdateFailedResult(failure!),
        (result) => getAllTaskSuccessResult(result)));
  }

  void getDeleteTask({required int id}) {
    change(null, status: RxStatus.loading());
    getDeleteTodoComponents(DeleteTodoParams(id: id)).then((value) =>
        value.fold((Failure? failure) => getUpdateFailedResult(failure!),
            (result) => getDeleteTaskSuccessResult(result)));
  }

  getDeleteTaskSuccessResult(result) {
    change("", status: RxStatus.success());
    MySnackBar.show("Success", "delete todo success");

    getAllTask();
  }

  getUpdateFailedResult(Failure failure,) async {
if (failure.body.toString().contains("The connection errored") ||
    !await MyConnectivityService.checkDataNetworks()) {

  MyRequestPendingService.saveRequest(() => getAllTask());
  print(MyErrorNetwork.isShowBottomShitNetworkError);
  if (!MyErrorNetwork.isShowBottomShitNetworkError) {
    MyErrorNetwork.isShowBottomShitNetworkError = true;
    MyBottomSheet.show(
        child: MyErrorNetwork.error(),
        isDraggable: false,
        isDismissible: false);
  }
  return;
}

    MySnackBar.show(failure.header.toString(), failure.body.toString());
    change(failure.body.toString(), status: RxStatus.error());
  }

  getAllTaskSuccessResult(result) {
    if (result == null) {
      change("", status: RxStatus.empty());
    } else {
      allTask?.assignAll(result.todos ?? []);
      change("", status: RxStatus.success());
    }
  }
}
