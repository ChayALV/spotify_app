// ignore_for_file: unnecessary_null_in_if_null_operators
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/loading.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/home_page/widgets/now_played_wid.dart';
import 'package:test_app_omni_doc/app/ui/pages/home_page/widgets/playing_in_wid.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/bacjgroud_image.dart';
import 'package:test_app_omni_doc/app/ui/pages/home_page/widgets/controller_buttoms.dart';
import 'package:test_app_omni_doc/app/ui/pages/home_page/widgets/recently_played_wid.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return SafeArea(
              child: Stack(
            children: [
              controller.obx(
                  (state) =>
                      FadeInUp(child: BackgroudImage(urlToImage: controller.nowPlayed?.item.album.images[0].url ?? null)),
                  onLoading: Center(child: Loading())),
              controller.obx(
                (state) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FadeInDown(
                      child: const Text(
                        'HOME',
                        style: TextStyle(
                          letterSpacing: 20,
                          fontSize: 45,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          // fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    FadeInLeft(
                        child: controller.nowPlayed != null
                            ? NowPlayedWid(controller: controller)
                            : Container()),
                    FadeInRight(
                        child: controller.recentlyPlayed != null 
                          ? RecentlyPlayedWid(controller: controller)
                          : const Center(child: Text(
                              'Start your music',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 20,
                                fontSize: 45,
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                // fontWeight: FontWeight.w900
                              ),
                            ),)
                      ),
                    FadeInUp(
                        child: ControllerButtoms(controller: controller)),
                    controller.nowPlayed != null && controller.divices != null  
                        ? PlayingIn(controller: controller)
                        : Container()
                  ],
                ),
                onLoading: Center(child: Loading()))
            ],
          ));
        },
      ),
    );
  }
}