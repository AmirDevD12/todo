import 'package:get/get.dart';
import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:todo/core/errors/failures.dart';
import 'package:todo/core/usecases/usecase.dart';
import 'package:todo/features/all_task/domain/entity/task_entity.dart';
import 'package:todo/features/all_task/domain/usecases/all_task_usecases.dart';

class AllTaskController extends GetxController
    with GetSingleTickerProviderStateMixin, StateMixin {
  final AllTaskComponents getAllTaskComponents;

  AllTaskController({required this.getAllTaskComponents});

  RxList<TodoEntity>? allTask = RxList();

  @override
  Future<void> onInit() async {
    getAllTask();
    super.onInit();
  }

  void getAllTask() {
    change(null, status: RxStatus.loading());
    getAllTaskComponents(NoParams()).then((value) => value.fold(
        (Failure? failure) => getUpdateFailedResult(failure!),
        (result) => getAllTaskSuccessResult(result)));
  }

  getUpdateFailedResult(Failure failure) {
    MySnackBar.show(failure.header.toString(), failure.body.toString());
    change(failure.body.toString(), status: RxStatus.error());
  }


  getAllTaskSuccessResult(result) {

    if (result == null) {
      change("", status: RxStatus.empty());
    }else {
      allTask?.assignAll(result.todos ?? []);
      change("", status: RxStatus.success());
    }
  }
}
