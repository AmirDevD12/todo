import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/completed_todo/domain/usecases/completed_todo_usecases.dart';

class CompletedTodoController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  final CompletedTodoComponents getCompletedComponents;

  CompletedTodoController({required this.getCompletedComponents});

  RxList<TodoEntity>? allTask = RxList();

  @override
  Future<void> onInit() async {
    getCompleted();
    super.onInit();
  }

  void getCompleted() {
    change(null, status: RxStatus.loading());
    getCompletedComponents(NoParams()).then((value) => value.fold(
        (Failure? failure) => getUpdateFailedResult(failure!),
        (result) => getCompletedSuccessResult(result)));
  }

  getUpdateFailedResult(Failure failure) {
    MySnackBar.show(failure.header.toString(), failure.body.toString());
    change(failure.body.toString(), status: RxStatus.error());
  }


  getCompletedSuccessResult(TaskEntity result) {

    if (result.todos == null) {
      change("", status: RxStatus.empty());
    }else {
      allTask?.addAll(result.todos!.where((e) => e.completed == true).toList());
      change("", status: RxStatus.success());
    }
  }
}
