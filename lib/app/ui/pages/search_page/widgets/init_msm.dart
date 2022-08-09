import 'package:flutter/material.dart';

class InitMessage extends StatelessWidget {
  const InitMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 150,),
        Text(
          'Discover your music',
          style: TextStyle(
            fontSize: 25,
            color: Colors.greenAccent.shade400,
            fontFamily: 'Montserrat_blod'
          )
        ),
        const Text(
          'SEARCH SOMETHING',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'Montserrat'
          )
        )
      ],
    );
  }
}