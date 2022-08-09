import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';

class ControllerButtoms extends StatelessWidget {
  final HomeController controller;
  const ControllerButtoms({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: ()=>controller.previusTrack(),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.grey.shade800,
                  offset: const Offset(-4, -4),
                  spreadRadius: 1),
                const BoxShadow(
                  blurRadius: 15,
                  color: Colors.black87,
                  offset: Offset(4, 4),
                  spreadRadius: 1),
              ]
            ),
            child:const Icon(FontAwesomeIcons.backwardStep,color: Colors.white,),
          ),
        ),
        GestureDetector(
          onTap: ()=> controller.isPlayed.value ? controller.pauseTrack() : controller.playTrack(),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.grey.shade800,
                  offset: const Offset(-4, -4),
                  spreadRadius: 1),
                const BoxShadow(
                  blurRadius: 15,
                  color: Colors.black87,
                  offset: Offset(4, 4),
                  spreadRadius: 1),
              ]
            ),
            child:controller.isPlayed.value ? Icon(FontAwesomeIcons.pause,color: Colors.greenAccent.shade400) : Icon(FontAwesomeIcons.play,color: Colors.greenAccent.shade400),
          ),
        ),
        GestureDetector(
          onTap: () => controller.nextTrack(),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.grey.shade800,
                  offset: const Offset(-4, -4),
                  spreadRadius: 1),
                const BoxShadow(
                  blurRadius: 15,
                  color: Colors.black87,
                  offset: Offset(4, 4),
                  spreadRadius: 1),
              ]
            ),
            child:const Icon(FontAwesomeIcons.forwardStep,color: Colors.white),
          ),
        ),
      ],
    );
  }
}