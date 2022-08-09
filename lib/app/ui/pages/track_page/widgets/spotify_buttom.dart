
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app_omni_doc/app/controllers/track_controller.dart';

class SpotifyButtom extends StatelessWidget {
  final TrackController controller;
  const SpotifyButtom({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>controller.goToUrlOfTrack(),
      child: Column(
        children: [
          const Text(
            'Open in',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontFamily: 'Montserrat',
            ),
          ),
          Icon(FontAwesomeIcons.spotify,size: 70,color: Colors.greenAccent.shade400,),
        ],
      ),
    );
  }
}