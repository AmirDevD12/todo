import 'package:get/get.dart';
import 'package:todo/features/edite_todo/data/datasource/edite_todo_datasource.dart';
import 'package:todo/features/edite_todo/data/repository/edite_todo_repository.dart';
import 'package:todo/features/edite_todo/domain/repository/edite_todo_repository.dart';
import 'package:todo/features/edite_todo/domain/usecases/edite_todo_usecases.dart';
import 'package:todo/features/edite_todo/presentation/controller/edite_todo_controller.dart';

class EditeTodoBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<EditeTodoDataSource>(EditeTodoDataSourceIml(Get.find()));
    Get.put<EditeTodoRepository>(EditeTodoRepositoryImp(Get.find()));
    Get.put<EditeTodoComponents>(EditeTodoComponents(repository: Get.find()));

    Get.put(EditeTodoController(getEditeTodoComponents: Get.find()));
    // TODO: implement dependencies
  }
  Future<void> inDependencies() async {
    Get.delete<EditeTodoController>();
  }
  Future<void> refreshPage() async {
    await inDependencies();
    dependencies();
  }
}