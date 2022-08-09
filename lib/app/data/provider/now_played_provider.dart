import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/now_played_model.dart';

class NowPLayed {
  Future getNowPlayed() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToNowPlayed = Uri.https(urlBase, '/v1/me/player');

    String authorizationWithToken = '$tokenType $token';


    var response = await http.get(urlToNowPlayed,
        headers: {'Authorization': authorizationWithToken});

    try {
      NowPlayedModel nowPlayed = NowPlayedModel.fromJson(response.body);
      return nowPlayed;
    } catch (e) {
      return false;
    }
  }
}
