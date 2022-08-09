import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/artist_model.dart';

class Artist {
  Future<ArtistModel> getArtistById(String id) async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToArtist = Uri.https(urlBase, '/v1/artists/$id');

    String authorizationWithToken = '$tokenType $token';

    var response = await http
        .get(urlToArtist, headers: {'Authorization': authorizationWithToken});
    ArtistModel artist = ArtistModel.fromJson(response.body);
    return artist;
  }
}
