import 'package:get/get.dart';
import 'package:todo/features/all_task/presentation/binding/all_task_binding.dart';

class HomePageBinding extends Bindings{
  @override
  void dependencies() {
    AllTaskBinding().dependencies();
    // TODO: implement dependencies
  }
}