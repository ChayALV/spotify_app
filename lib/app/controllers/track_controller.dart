// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/controllers/home_controller.dart';
import 'package:test_app_omni_doc/app/data/models/divices_model.dart';
import 'package:test_app_omni_doc/app/data/models/track_model.dart';
import 'package:test_app_omni_doc/app/data/provider/divices_provider.dart';
import 'package:test_app_omni_doc/app/data/provider/track_provider.dart';
import 'package:test_app_omni_doc/app/data/services/play_track_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackController extends GetxController with StateMixin {
  final String idTrack;
  TrackController(this.idTrack) {
    getTrack();
    getDivices();
  }
  final homeController = Get.find<HomeController>();
  TrackModel? track;
  DivicesModel? divices;

  getDivices() async {
    divices = await Divices().getDivices();
  }

  getTrack() async {
    track = await Track().getTrackById(idTrack);
    change(null, status: RxStatus.success());
  }

  goToUrlOfTrack() async {
    await launch(track!.externalUrls.spotify);
  }

  playTrack(String diviceID) async {
    await PlayTrack().playTrack(idTrack, diviceID);
    homeController.getNowPlayed();
  }

  IconData getIconOfDiviceType(String type) {
    if (type == 'Computer') return FontAwesomeIcons.computer;
    if (type == 'Speaker') return FontAwesomeIcons.volumeHigh;
    if (type == 'Smartphone') return FontAwesomeIcons.mobilePhone;

    return FontAwesomeIcons.skull;
  }
}
