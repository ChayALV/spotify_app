import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class BackgroudImage extends StatelessWidget {
  final String? urlToImage;
  const BackgroudImage({Key? key, this.urlToImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: displayWidth(context),
            child: Stack(
              children: [
                Image.network(urlToImage != null
                    ? urlToImage!
                    : 'https://i.pinimg.com/564x/6a/22/ae/6a22ae12f75fbeb1858758181a624cd8.jpg'),
                Container(
                    width: displayWidth(context),
                    height: displayHeight(context) * 0.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor.withOpacity(0.99),
                          Theme.of(context).primaryColor.withOpacity(0.95),
                          Theme.of(context).primaryColor.withOpacity(0.9),
                          Theme.of(context).primaryColor.withOpacity(0.8),
                          Theme.of(context).primaryColor.withOpacity(0.7),
                          Theme.of(context).primaryColor.withOpacity(0.6),
                          Theme.of(context).primaryColor.withOpacity(0.5),
                          Theme.of(context).primaryColor.withOpacity(0.4),
                          Theme.of(context).primaryColor.withOpacity(0.3),
                          Theme.of(context).primaryColor.withOpacity(0.2),
                        ])))
              ],
            )),
      ],
    );
  }
}
