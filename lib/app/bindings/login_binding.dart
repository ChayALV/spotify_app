import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
