import 'package:flutter/material.dart';

class TitleOfHome extends StatelessWidget {
  const TitleOfHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Test Application with',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Playfair_Display',
            fontSize: 55
          ),
        ),
        Text(
          'spotify',
          style: TextStyle(
            color: Colors.greenAccent.shade400,
            fontFamily: 'Playfair_Display',
            fontSize: 100,
              height: 0.7 
          ),
        ),
      ],
    );
  }
}