import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/album_model.dart' as album;

class Album {
  Future<album.AlbumModel> getAlbumById(String id) async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToAlbum = Uri.https(urlBase, '/v1/albums/$id');

    String authorizationWithToken = '$tokenType $token';

    var response = await http
        .get(urlToAlbum, headers: {'Authorization': authorizationWithToken});

    album.AlbumModel track = album.AlbumModel.fromJson(response.body);

    return track;
  }
}
