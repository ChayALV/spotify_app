
import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class TrackInformation extends StatelessWidget {
  final TrackController controller;
  const TrackInformation({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          controller.track!.name,
          textAlign: TextAlign.center,
          style:const TextStyle(
            fontSize: 50,
            color: Colors.white,
            fontFamily: 'Montserrat',
            // fontWeight: FontWeight.w900
          ),
        ),
        const SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 150,
              width: 150,
              child: Image.network(controller.track!.album.images[0].url),
            ),
            SizedBox(
              width: displayWidth(context)*0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Artist',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: 'Montserrat_blod',
                    ),
                  ),
                  Text(
                    controller.track!.artists[0].name,
                    style:const TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      // fontWeight: FontWeight.w900
                    ),
                  ),
                  Text(
                    controller.track!.album.name,
                    style:const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      // fontWeight: FontWeight.w900
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
