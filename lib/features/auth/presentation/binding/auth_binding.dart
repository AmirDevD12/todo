import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:todo/features/auth/presentation/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(AuthController());
    // TODO: implement dependencies
  }
  Future<void> inDependencies() async {
    Get.delete<AuthController>();
  }
  Future<void> refreshPage() async {
    await inDependencies();
    dependencies();
  }
}