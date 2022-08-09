import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/search_model.dart';

class Search {
  Future<SearchModel> getResults(String search) async {
    print(search);
    final localStorage = await SharedPreferences.getInstance();

    String? token = localStorage.getString('token');
    String? tokenType = localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    String authorizationWithToken = '$tokenType $token';

    Uri urlToSearch = Uri.https(urlBase, '/v1/search',
        {'q': search, 'type': 'artist,playlist,album,track', 'limit': '5'});

    var response = await http
        .get(urlToSearch, headers: {'Authorization': authorizationWithToken});
    SearchModel results = SearchModel.fromJson(response.body);
    return results;
  }
}
