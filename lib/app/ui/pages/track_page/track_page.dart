import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/loading.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/bacjgroud_image.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/widgets/play_buttome.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/widgets/spotify_buttom.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/widgets/track_information.dart';

class TrackPage extends GetView<TrackController> {
  const TrackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TrackController>(
        builder: (controller) {
          return SafeArea(
            child: controller.obx(
              (state) => Stack(
                alignment: Alignment.center,
                children: [
                  FadeInUp(child: BackgroudImage(urlToImage: controller.track!.album.images[0].url,)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeInDown(child: TrackInformation(controller: controller)),
                      FadeIn(child: SpotifyButtom(controller: controller)),
                      FadeInUp(child: PlayButtom(controller: controller))
                    ],
                  )
                ],
              ),
              onLoading: Center(child: Loading(),)
            )
          );
        },
      )
    );
  }
}
