import 'package:flutter/material.dart';

class ContainerNeuPhis extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  const ContainerNeuPhis({
    Key? key, 
      required this.child,
      required this.width,
      required this.height
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(25),
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
            ]),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
