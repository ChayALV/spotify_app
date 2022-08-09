import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class Loading extends StatelessWidget {
  double? size;
  Loading({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.greenAccent.shade400, 
      size: size ?? 50
    );
  }
}
