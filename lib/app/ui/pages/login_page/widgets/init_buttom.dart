import 'package:flutter/material.dart';
import 'package:test_app_omni_doc/app/controllers/login_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/container_neumorphism.dart';

class StartButtom extends StatelessWidget {
  final LoginController controller;
  const StartButtom({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> controller.getAuthorization(),
      child: ContainerNeuPhis(
        width: 250,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Start',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Playfair_Display',
                  fontSize: 35),
            ),
            SizedBox(
                width: 40,
                height: 40,
                child: Image.asset('assets/images/174872.png'))
          ],
        ),
      ),
    );
  }
}
