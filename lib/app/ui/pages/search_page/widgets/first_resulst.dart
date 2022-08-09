import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/album_controller.dart';
import 'package:test_app_omni_doc/app/controllers/artist_controller.dart';
import 'package:test_app_omni_doc/app/controllers/search_controller.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/album_page/album_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/artist_page/artist_page.dart';
import 'package:test_app_omni_doc/app/ui/pages/search_page/widgets/result.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/track_page.dart';

class FirstResults extends StatelessWidget {
  final SearchController controller;
  const FirstResults({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (controller.results!.artists.items.isNotEmpty &&
            controller.results!.artists.items[0].images.isNotEmpty)
          Result(
            urlToImage: controller.results!.artists.items[0].images[0].url,
            name: controller.results!.artists.items[0].name,
            type: 'Artist',
            callback: () => showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  Get.lazyPut<ArtistController>(() => ArtistController(
                      controller.results!.artists.items[0].id));
                  return const ArtistPage();
                }),
          ),
        if (controller.results!.albums.items.isNotEmpty &&
            controller.results!.albums.items[0].images.isNotEmpty)
          Result(
            urlToImage: controller.results!.albums.items[0].images[0].url,
            name: controller.results!.albums.items[0].name,
            type: 'Album',
            artist: controller.results!.albums.items[0].artists[0].name,
            callback: () => showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  Get.lazyPut<AlbumController>(() =>
                      AlbumController(controller.results!.albums.items[0].id));
                  return const AlbumPage();
                }),
          ),
        if (controller.results!.tracks.items.isNotEmpty &&
            controller.results!.tracks.items[0].album.images.isNotEmpty)
          Result(
            urlToImage: controller.results!.tracks.items[0].album.images[0].url,
            name: controller.results!.tracks.items[0].name,
            type: 'Track',
            artist: controller.results!.tracks.items[0].artists[0].name,
            callback: () => showMaterialModalBottomSheet(
                context: context,
                builder: (context) {
                  Get.lazyPut<TrackController>(() =>
                      TrackController(controller.results!.tracks.items[0].id));
                  return const TrackPage();
                }),
          ),
      ],
    );
  }
}
