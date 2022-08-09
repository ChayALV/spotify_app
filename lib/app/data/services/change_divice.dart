// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChangeDivice {
  changeDivice(String idDivice) async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/me/player');

    String authorizationWithToken = '$tokenType $token';

    Map body = {
      "device_ids": [idDivice]
    };
    var response = await http.put(urlToPlayList, body: jsonEncode(body), headers: {
      'Authorization': authorizationWithToken
    });
  }
}
