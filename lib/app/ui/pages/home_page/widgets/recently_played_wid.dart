import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/pages/track_page/track_page.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class RecentlyPlayedWid extends StatelessWidget {
  final HomeController controller;
  const RecentlyPlayedWid({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
        Get.lazyPut<TrackController>(
            () => TrackController(controller.recentlyPlayed!.items[0].track.id));
        return const TrackPage();
      }),
      child: Column(
        children: [
          const Text(
            'Recently played',
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
                height: 90,
                width: 90,
                child: Image.network(controller.recentlyPlayed!.items[0].track.album.images[0].url),
              ),
              SizedBox(
                width: displayWidth(context)*0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.recentlyPlayed!.items[0].track.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:const  TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: 'Montserrat_blod',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      controller.recentlyPlayed!.items[0].track.album.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      controller.recentlyPlayed!.items[0].track.artists[0].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:const  TextStyle(
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
