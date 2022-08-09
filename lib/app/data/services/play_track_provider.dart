import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PlayTrack {
  playTrack(String idTrack, String diviceID) async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayTrack =
        Uri.https(urlBase, '/v1/me/player/play', {'device_id': diviceID});

    log(urlToPlayTrack.toString());
    String authorizationWithToken = '$tokenType $token';

    Map body = {
      "uris": ["spotify:track:$idTrack"]
    };
    // ignore: unused_local_variable
    var response = await http.put(urlToPlayTrack,
        body: jsonEncode(body),
        headers: {'Authorization': authorizationWithToken});
  }
}
