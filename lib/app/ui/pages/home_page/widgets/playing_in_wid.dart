import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';
import 'package:test_app_omni_doc/app/ui/global_widgets/container_neumorphism.dart';
import 'package:test_app_omni_doc/app/ui/utils/media_query.dart';

class PlayingIn extends StatelessWidget {
  final HomeController controller;
  const PlayingIn({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => SizedBox(
            height: displayHeight(context) * 0.5,
            child: Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Divices',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.greenAccent.shade400,
                        fontFamily: 'Montserrat_blod',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    children: List.generate(
                      controller.divices!.devices.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ContainerNeuPhis(
                          height: 80,
                          width: displayWidth(context),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20, right: 30, top: 10),
                            child: GestureDetector(
                              onTap: () => controller.changeDivice(
                                  controller
                                      .divices!.devices[index].id),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Divice',
                                        style: TextStyle(
                                          letterSpacing: 15,
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: 'Montserrat',
                                          // fontWeight: FontWeight.w900
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                      Text(
                                        controller.divices!
                                            .devices[index].name,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors
                                              .greenAccent.shade400,
                                          fontFamily: 'Montserrat_blod',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    controller.getIconOfDiviceType(
                                      controller
                                          .divices!.devices[index].type,
                                    ),
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
          )
        );
      },
      child: Column(
        children: [
          const Text(
            'Playing in',
            style: TextStyle(
              letterSpacing: 15,
              fontSize: 15,
              color: Colors.white,
              fontFamily: 'Montserrat',
              // fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.start,
          ),
          Text(
            controller.nowPlayed!.device.name,
            style: TextStyle(
              letterSpacing: 5,
              fontSize: 20,
              color: Colors.greenAccent.shade400,
              fontFamily: 'Montserrat_blod',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 70,)
        ],
      ),
    );
  }
}