import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'created by',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 12
          ),
        ),
        Text(
          'Gabriel Isaac Corrales Escorcia',
          style: TextStyle(
            color: Colors.greenAccent.shade400,
            fontFamily: 'Montserrat_blod',
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}