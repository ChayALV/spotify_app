import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/bindings/login_binding.dart';
import 'package:test_app_omni_doc/app/ui/theme/theme.dart' as theme;

import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.LOGIN,
    defaultTransition: Transition.fade,
    initialBinding: LoginBinding(),
    getPages: AppPages.pages,
    theme: theme.Theme().theme,
  ));
}
