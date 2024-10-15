import 'package:get/get.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';
import 'package:todo/features/home/presentation/controller/home_controller.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    AllTaskBinding().dependencies();
    Get.put(HomeController());
    // TODO: implement dependencies
  }
}