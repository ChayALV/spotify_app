// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:test_app_omni_doc/app/data/models/divices_model.dart';
import 'package:test_app_omni_doc/app/data/models/now_played_model.dart';
import 'package:test_app_omni_doc/app/data/models/recently_played_model.dart';
import 'package:test_app_omni_doc/app/data/provider/divices_provider.dart';
import 'package:test_app_omni_doc/app/data/provider/now_played_provider.dart';
import 'package:test_app_omni_doc/app/data/provider/recently_played_provider.dart';
import 'package:test_app_omni_doc/app/data/services/change_divice.dart';
import 'package:test_app_omni_doc/app/data/services/controlers_player.dart';

class HomeController extends GetxController with StateMixin {
  HomeController() {
    getNowPlayed();
    getDivices();
  }
  RecentlyPlayedModel? recentlyPlayed;
  NowPlayedModel? nowPlayed;
  DivicesModel? divices;

  var isPlayed = false.obs;

  getRecentlyPlayed() async {
    recentlyPlayed = await RecentlyPlayed().getRecentlyPlayed();
    change(null, status: RxStatus.success());
  }

  getNowPlayed() async {
    change(null, status: RxStatus.loading());
    if (await NowPLayed().getNowPlayed() == false) {
      nowPlayed = null;
    }else{
      nowPlayed = await NowPLayed().getNowPlayed();
      isPlayed.value = nowPlayed!.isPlaying;
    }
    getRecentlyPlayed();
  }

  getDivices() async {
    divices = await Divices().getDivices();
  }

  nextTrack() async {
    change(null, status: RxStatus.loading());
    await ControllesOfPlayed().nextTrack();
    getNowPlayed();
  }

  playTrack() async {
    isPlayed.value = true;
    await ControllesOfPlayed().playTrack();
    getNowPlayed();
  }

  pauseTrack() async {
    isPlayed.value = false;
    await ControllesOfPlayed().pauseTrack();
    getNowPlayed();
  }

  previusTrack() async {
    change(null, status: RxStatus.loading());
    await ControllesOfPlayed().previusTrack();
    getNowPlayed();
  }

  changeDivice(String idDivice) async {
    change(null, status: RxStatus.loading());
    await ChangeDivice().changeDivice(idDivice);
    getNowPlayed();
  }

  IconData getIconOfDiviceType(String type) {
    if (type == 'Computer') return FontAwesomeIcons.computer;
    if (type == 'Speaker') return FontAwesomeIcons.volumeHigh;
    if (type == 'Smartphone') return FontAwesomeIcons.mobilePhone;

    return FontAwesomeIcons.skull;
  }
}
