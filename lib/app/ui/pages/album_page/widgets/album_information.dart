import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/controllers/album_controller.dart';

class AlbumInformation extends StatelessWidget {
  final AlbumController controller;
  const AlbumInformation({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Container(
          width: 300,
          height: 300,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.white, width: 5)),
          child: Image.network(controller.album!.images[0].url),
        ),
        Text(
          controller.album!.name.toString(),
          maxLines: 3,
          textAlign: TextAlign.center,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 35,
              fontFamily: 'Montserrat',
              color: Colors.white),
        ),
        Text(
          controller.album!.artists[0].name,
          maxLines: 3,
          textAlign: TextAlign.start,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 25,
              fontFamily: 'Montserrat',
              color: Colors.white),
        ),
        Text(
          controller.album!.releaseDate,
          maxLines: 3,
          textAlign: TextAlign.start,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 15,
              fontFamily: 'Montserrat',
              color: Colors.white),
        )
      ],
    );
  }
}
