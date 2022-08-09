
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class Result extends StatelessWidget {
  final String urlToImage;
  final String name;
  final String type;
  final String? artist;
  final VoidCallback callback;
  const Result({
    Key? key, 
    required this.urlToImage, 
    required this.name, 
    required this.callback, 
    required this.type, this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GestureDetector(
        onTap: callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                  urlToImage),
            ),
            SizedBox(
              width: displayWidth(context) * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                  Text(
                    name,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 25,
                        fontFamily: 'Montserrat_blod',
                        color: Colors.white),
                  ),
                  Text(
                    artist ?? '',
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}