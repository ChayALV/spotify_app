import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/recently_played_model.dart';

class RecentlyPlayed {
  Future<RecentlyPlayedModel> getRecentlyPlayed() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList =
        Uri.https(urlBase, '/v1/me/player/recently-played', {'limit': '1'});

    String authorizationWithToken = '$tokenType $token';

    log(urlToPlayList.toString());

    var response = await http
        .get(urlToPlayList, headers: {'Authorization': authorizationWithToken});

    RecentlyPlayedModel recentlyPlaye =
        RecentlyPlayedModel.fromJson(response.body);
    return recentlyPlaye;
  }
}
