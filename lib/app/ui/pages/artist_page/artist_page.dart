import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/ui/pages/artist_page/widgets/artist_information.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/loading.dart';
import 'package:test_app_omni_doc/app/controllers/album_controller.dart';
import 'package:test_app_omni_doc/app/controllers/artist_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/album_page/album_page.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/bacjgroud_image.dart';
import 'package:test_app_omni_doc/app/ui/pages/artist_page/widgets/album.dart';

class ArtistPage extends GetView<ArtistController> {
  const ArtistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<ArtistController>(
      builder: (controller) {
        return SafeArea(
          child: controller.obx(
              (state) => Stack(
                alignment: Alignment.center,
                children: [
                  BackgroudImage(
                    urlToImage: controller.artist!.images[0].url,
                  ),
                  SizedBox(
                    width: displayWidth(context),
                    height: displayHeight(context),
                    child: ListView(
                      children: [
                        ArtistInformation(controller: controller,),
                        Column(
                          children: List.generate(
                            controller.albums!.items.length, 
                            (index) => Album(
                              urlToImage: controller.albums!.items[index].images[0].url,
                              name:  controller.albums!.items[index].name,
                              callback: () => showMaterialModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  Get.lazyPut<AlbumController>(
                                      () => AlbumController(controller.albums!.items[index].id));
                                  return const AlbumPage();
                                }),
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              onLoading: Center(child: Loading()
            )
          )
        );
      },
    ));
  }
}

