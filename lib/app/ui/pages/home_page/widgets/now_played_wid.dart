
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/track_page.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class NowPlayedWid extends StatelessWidget {
  final HomeController controller;
  const NowPlayedWid({Key? key,required this.controller }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: ()=> showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        Get.lazyPut<TrackController>(
            () => TrackController(controller.nowPlayed!.item.id));
        return const TrackPage();
      }),
      child: Column(
        children: [
          const Text(
            'Now played',
            style: TextStyle(
              letterSpacing: 10,
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Montserrat',
              // fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 125,
                width: 125,
                child: Image.network(controller.nowPlayed!.item.album.images[0].url),
              ),
              SizedBox(
                width: displayWidth(context)*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.nowPlayed!.item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Montserrat_blod',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      controller.nowPlayed!.item.album.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        // fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      controller.nowPlayed!.item.artists[0].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        // fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
