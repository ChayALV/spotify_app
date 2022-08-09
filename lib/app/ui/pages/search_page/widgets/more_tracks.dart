import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/result.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/track_page.dart';

class MoreTracks extends StatelessWidget {
  final SearchController controller;
  const MoreTracks({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text('More tracks',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.greenAccent.shade400,
                  fontFamily: 'Montserrat_blod')),
        ),
        Column(
          children: List.generate(
            controller.results!.tracks.items.length,
            (index) => Result(
              urlToImage:
                  controller.results!.tracks.items[index].album.images[0].url,
              name: controller.results!.tracks.items[index].name,
              type: 'Track',
              artist: controller.results!.tracks.items[index].artists[0].name,
              callback: () => showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) {
                    Get.lazyPut<TrackController>(() => TrackController(
                        controller.results!.tracks.items[index].id));
                    return const TrackPage();
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
