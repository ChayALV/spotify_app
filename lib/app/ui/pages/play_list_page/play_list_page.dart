// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/controllers/play_list_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/container_neumorphism.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/loading.dart';
import 'package:test_app_omni_doc/app/ui/pages/play_list_page/widgets/play_lsit.dart'
    as widget;
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';
import 'package:url_launcher/url_launcher.dart';

class PlayListPage extends GetView<PlayListController> {
  const PlayListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<PlayListController>(
      builder: (controller) {
        return SafeArea(
          child: controller.obx(
              (state) => SizedBox(
                    width: displayWidth(context),
                    height: displayHeight(context),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: ContainerNeuPhis(
                            width: displayWidth(context) * 0.8,
                            height: 70,
                            child: const Text(
                              'Your play list',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 17,
                                  fontFamily: 'Montserrat_blod',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Column(
                          children: List.generate(
                              controller.playLists!.items.length,
                              (index) => widget.PlayListItem(
                                    urlToImage: controller.playLists!
                                            .items[index].images.isNotEmpty
                                        ? controller.playLists!.items[index]
                                            .images[0].url
                                        : 'https://i.pinimg.com/564x/6a/22/ae/6a22ae12f75fbeb1858758181a624cd8.jpg',
                                    name:
                                        controller.playLists!.items[index].name,
                                    callback: () {
                                      launch(controller.playLists!.items[index]
                                          .externalUrls.spotify);
                                    },
                                  )),
                        ),
                        const SizedBox(height: 100,)
                      ],
                    ),
                  ),
              onLoading: Center(
                child: Loading(),
                ),
              onError: (error) => const Center(child: Text(
                  'PlayList?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 20,
                    fontSize: 45,
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    // fontWeight: FontWeight.w900
                  ),
                ),),
              ),
              
        );
      },
    ));
  }
}
