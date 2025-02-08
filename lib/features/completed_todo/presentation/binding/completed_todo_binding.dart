import 'package:get/get.dart';
import 'package:todo/features/all_task/data/datasource/all_task_datasource.dart';
import 'package:todo/features/all_task/data/repository/all_task_repository.dart';
import 'package:todo/features/all_task/domain/repository/all_task_repository.dart';
import 'package:todo/features/all_task/domain/usecases/all_task_usecases.dart';
import 'package:todo/features/all_task/domain/usecases/delete_todo_usecas.dart';
import 'package:todo/features/all_task/presentation/controller/all_task_controller.dart';
import 'package:todo/features/completed_todo/data/datasource/completed_todo_datasource.dart';
import 'package:todo/features/completed_todo/data/repository/completed_todo_repository.dart';
import 'package:todo/features/completed_todo/domain/repository/completed_todo_repository.dart';
import 'package:todo/features/completed_todo/domain/usecases/completed_todo_usecases.dart';
import 'package:todo/features/completed_todo/presentation/controller/completed_todo_controller.dart';

class CompletedTodoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<CompletedTodoDataSource>(CompletedTodoDataSourceImp(Get.find()));
    Get.put<CompletedTodoRepository>(CompletedTodoRepositoryImp(Get.find()));
    Get.put<CompletedTodoComponents>(CompletedTodoComponents(repository: Get.find()));

    Get.put(CompletedTodoController(getCompletedComponents: Get.find(),));
    // TODO: implement dependencies
  }
  Future<void> inDependencies() async {
    Get.delete<CompletedTodoController>();
  }
  Future<void> refreshPage() async {
    await inDependencies();
    dependencies();
  }
}