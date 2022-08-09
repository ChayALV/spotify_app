import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/album_controller.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/bacjgroud_image.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/loading.dart';
import 'package:test_app_omni_doc/app/ui/pages/album_page/widgets/album_information.dart';
import 'package:test_app_omni_doc/app/ui/pages/album_page/widgets/track.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/track_page.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class AlbumPage extends GetView<AlbumController> {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AlbumController>(
        builder: (controller) {
          return SafeArea(
            child: controller.obx(
              (state) => Stack(
                children: [
                  BackgroudImage(urlToImage: controller.album!.images[0].url,),
                  SizedBox(
                    width: displayWidth(context),
                    height: displayHeight(context),
                    child: ListView(
                      children: [
                        AlbumInformation(controller: controller),
                        Column(
                          children: List.generate(
                            controller.album!.totalTracks, 
                            (index) => Track(
                              urlToImage: controller.album!.images[0].url, 
                              name: controller.album!.tracks.items[index].name, 
                              callback:() => showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  Get.lazyPut<TrackController>(
                                      () => TrackController(controller.album!.tracks.items[index].id));
                                  return const TrackPage();
                                })
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              onLoading: Center(child: Loading(),)
            )
          );
        },
      ));
  }
}