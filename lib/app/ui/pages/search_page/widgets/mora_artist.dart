import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/artist_controller.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/artist_page/artist_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/result.dart';

class MoreArtist extends StatelessWidget {
  final SearchController controller;
  const MoreArtist({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text('More artist',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.greenAccent.shade400,
                  fontFamily: 'Montserrat_blod')),
        ),
        Column(
          children: List.generate(
            controller.results!.artists.items.length,
            (index) => Result(
              urlToImage: controller
                      .results!.artists.items[index].images.isEmpty
                  ? 'https://i.pinimg.com/564x/6a/22/ae/6a22ae12f75fbeb1858758181a624cd8.jpg'
                  : controller.results!.artists.items[index].images[0].url,
              name: controller.results!.artists.items[index].name,
              type: 'Artist',
              callback: () => showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  Get.lazyPut<ArtistController>(() => ArtistController(
                      controller.results!.artists.items[index].id));
                  return const ArtistPage();
                }),
            ),
          ),
        ),
      ],
    );
  }
}
