import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/controllers/menu_controller.dart';

class MenuBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MenuController>(() => MenuController());
  }
}