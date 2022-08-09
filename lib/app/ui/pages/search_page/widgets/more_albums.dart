import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/album_controller.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/album_page/album_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/result.dart';

class MoreAlbums extends StatelessWidget {
  final SearchController controller;
  const MoreAlbums({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text('More albums',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.greenAccent.shade400,
                  fontFamily: 'Montserrat_blod')),
        ),
        Column(
          children: List.generate(
            controller.results!.albums.items.length,
            (index) => Result(
              urlToImage: controller.results!.albums.items[index].images[0].url,
              name: controller.results!.albums.items[index].name,
              type: 'Album',
              artist: controller.results!.albums.items[index].artists[0].name,
              callback: () => showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) {
                    Get.lazyPut<AlbumController>(() => AlbumController(
                        controller.results!.albums.items[index].id));
                    return const AlbumPage();
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
