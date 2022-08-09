import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/controllers/artist_controller.dart';

class ArtistInformation extends StatelessWidget {
  final ArtistController controller;
  const ArtistInformation({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 300,
          height: 300,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white, width: 5)),
          child: Image.network(controller.artist!.images[0].url),
        ),
        Text(
          controller.artist!.name,
          maxLines: 3,
          textAlign: TextAlign.start,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 35,
              fontFamily: 'Montserrat',
              color: Colors.white),
        ),
        Text(
          'Followers : ${controller.artist!.followers.total}',
          maxLines: 3,
          textAlign: TextAlign.start,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 25,
              fontFamily: 'Montserrat',
              color: Colors.white),
        ),
      ],
    );
  }
}
