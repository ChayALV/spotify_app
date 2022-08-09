import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/bindings/menu_binding.dart';
import 'package:test_app_omni_doc/app/ui/pages/login_page/login_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/menu_page/menu_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        transition: Transition.fadeIn),
        GetPage(
        name: Routes.MENU,
        page: () => const MenuPage(),
        transition: Transition.fadeIn,
        binding: MenuBinding())
  ];
}
