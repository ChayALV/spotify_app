// ignore_for_file: library_prefixes

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/albums_of_artist_model.dart' as albumsOfArtist;

class AlbumsOfArtist {
  Future<albumsOfArtist.AlbumsOfArtistModel> getAlbumsByIdArtist(String id) async {
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToAlbums = Uri.https(urlBase, '/v1/artists/$id/albums');

    String authorizationWithToken = '$tokenType $token';

    var response = await http
        .get(urlToAlbums, headers: {'Authorization': authorizationWithToken});
    albumsOfArtist.AlbumsOfArtistModel albums = albumsOfArtist.AlbumsOfArtistModel.fromJson(response.body);
    return albums;
  }
}
