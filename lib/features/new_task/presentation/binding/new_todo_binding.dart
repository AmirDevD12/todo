import 'package:get/get.dart';
import 'package:todo/features/new_task/data/datasource/all_task_datasource.dart';
import 'package:todo/features/new_task/data/repository/all_task_repository.dart';
import 'package:todo/features/new_task/domain/repository/all_task_repository.dart';
import 'package:todo/features/new_task/domain/usecases/all_task_usecases.dart';
import 'package:todo/features/new_task/presentation/controller/new_todo_controller.dart';

class NewTodoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<NewTodoDatasource>(NewTodoDatasourceIml(Get.find()));
    Get.put<NewTodoRepository>(NewTodoRepositoryImp(Get.find()));
    Get.put<NewTodoComponents>(NewTodoComponents(repository: Get.find()));

    Get.put(NewTodoController(getNewTodoComponents: Get.find()));
  }
  Future<void> inDependencies() async {
    Get.delete<NewTodoController>();
  }
  Future<void> refreshPage() async {
    await inDependencies();
    dependencies();
  }
}