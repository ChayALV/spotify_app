import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/play_list_model.dart';

class PlayList {
  Future<PlayListModel> getPlayList() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/me/playlists');

    String authorizationWithToken = '$tokenType $token';

    var response = await http
        .get(urlToPlayList, headers: {'Authorization': authorizationWithToken});

    PlayListModel playList = PlayListModel.fromJson(response.body);

    return playList;
  }
}
