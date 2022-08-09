// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ControllesOfPlayed {
  nextTrack() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/me/player/next');

    String authorizationWithToken = '$tokenType $token';

    var response = await http.post(urlToPlayList,
        headers: {'Authorization': authorizationWithToken});
  }

  playTrack() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/me/player/play');

    String authorizationWithToken = '$tokenType $token';

    var response = await http.put(urlToPlayList,
        headers: {'Authorization': authorizationWithToken});
  }

  pauseTrack() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/me/player/pause');

    String authorizationWithToken = '$tokenType $token';

    var response = await http.put(urlToPlayList,
        headers: {'Authorization': authorizationWithToken});
  }

  previusTrack() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/me/player/previous');

    String authorizationWithToken = '$tokenType $token';

    var response = await http.post(urlToPlayList,
        headers: {'Authorization': authorizationWithToken});
  }
}
