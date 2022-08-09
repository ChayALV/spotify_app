import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/track_model.dart';

class Track {
  Future<TrackModel> getTrackById(String id) async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToPlayList = Uri.https(urlBase, '/v1/tracks/$id');

    String authorizationWithToken = '$tokenType $token';

    var response = await http
        .get(urlToPlayList, headers: {'Authorization': authorizationWithToken});

    TrackModel track = TrackModel.fromJson(response.body);

    return track;
  }
}
