import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_omni_doc/app/data/models/divices_model.dart';

class Divices {
  Future<DivicesModel> getDivices() async {
    final localStorage = await SharedPreferences.getInstance();

    String? token =  localStorage.getString('token');
    String? tokenType =  localStorage.getString('tokenType');

    String urlBase = 'api.spotify.com';

    Uri urlToDivices = Uri.https(urlBase, '/v1/me/player/devices');

    String authorizationWithToken = '$tokenType $token';

    var response = await http
        .get(urlToDivices, headers: {'Authorization': authorizationWithToken});

    DivicesModel divices = DivicesModel.fromJson(response.body);

    return divices;
  }
}
