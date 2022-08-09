import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';

import 'package:test_app_omni_doc/app/controllers/login_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/loading.dart';
import 'package:test_app_omni_doc/app/ui/pages/login_page/widgets/credits.dart';
import 'package:test_app_omni_doc/app/ui/pages/login_page/widgets/init_buttom.dart';
import 'package:test_app_omni_doc/app/ui/pages/login_page/widgets/title_of_home.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return SafeArea(
            child: Stack(
              children: [
                const DropdownAlert(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInLeftBig(child: const TitleOfHome()),

                    controller.obx(
                      (state) => FadeInUp(child: StartButtom(controller: controller,)),
                      onLoading: FadeIn(
                        child: Loading(),
                      ),
                    ),

                    const Credits()
                  ],
                ),
              ],
            )
          );
        },
      )
    );
  }
}
