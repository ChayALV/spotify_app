
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class Track extends StatelessWidget {
  final String urlToImage;
  final String name;
  final VoidCallback callback;
  const Track({
    Key? key, 
    required this.urlToImage, 
    required this.name, 
    required this.callback, 
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GestureDetector(
        onTap: callback,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Image.network(
                  urlToImage),
            ),
            SizedBox(
              width: displayWidth(context) * 0.6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 17,
                        fontFamily: 'Montserrat_blod',
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}