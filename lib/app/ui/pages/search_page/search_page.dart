import 'package:animate_do/animate_do.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/mora_artist.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/more_albums.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/more_tracks.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/init_msm.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/search_bar.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/first_resulst.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<SearchController>(
      builder: (controller) => SafeArea(
        child: Column(
            children: [
              const SizedBox(height: 20,),
              FadeInDown(child: SearchBar(controller:controller)),
              controller.obx(
                (state) => Padding(
                  padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: displayHeight(context)*0.815,
                      width: displayWidth(context),
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              FirstResults(controller: controller),
                              MoreTracks(controller: controller),
                              MoreAlbums(controller: controller),
                              MoreArtist(controller: controller),
                              const SizedBox(height: 100,)
                            ],
                          ),
                        ],
                      ),
                    )
                  ),
                  onLoading: const InitMessage()
              )
            ],
          )
        )
      )
    );
  }
}