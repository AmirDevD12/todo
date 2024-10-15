import 'package:get/get.dart';
import 'package:todo/features/all_task/data/datasource/all_task_datasource.dart';
import 'package:todo/features/all_task/data/repository/all_task_repository.dart';
import 'package:todo/features/all_task/domain/repository/all_task_repository.dart';
import 'package:todo/features/all_task/domain/usecases/all_task_usecases.dart';
import 'package:todo/features/all_task/domain/usecases/delete_todo_usecas.dart';
import 'package:todo/features/all_task/presentation/controller/all_task_controller.dart';

class AllTaskBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<AllTaskDataSource>(AllTaskDataSourceIml(Get.find()));
    Get.put<AllTaskRepository>(AllTaskRepositoryImp(Get.find()));
    Get.put<AllTaskComponents>(AllTaskComponents(repository: Get.find()));
    Get.put<DeleteTodoComponents>(DeleteTodoComponents(repository: Get.find()));

    Get.put(AllTaskController(getAllTaskComponents: Get.find(),getDeleteTodoComponents: Get.find()));
    // TODO: implement dependencies
  }
  Future<void> inDependencies() async {
    Get.delete<AllTaskController>();
  }
  Future<void> refreshPage() async {
    await inDependencies();
    dependencies();
  }
}