import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:test_app_omni_doc/app/data/models/token_model.dart';
import 'package:test_app_omni_doc/app/routes/app_pages.dart';

import '../global_v.dart' as global;

class LoginController extends GetxController with StateMixin {
  LoginController() {
    change(null, status: RxStatus.success());
  }

  getAuthorization() async {
    change(null, status: RxStatus.loading());

    const String url = "https://accounts.spotify.com/authorize";
    const String redirectUri = "spotify://spotify";
    const String scope =
        "playlist-read-private playlist-read-collaborative app-remote-control user-read-playback-state user-read-currently-playing playlist-read-private streaming user-read-recently-played user-modify-playback-state";
    const String responseType = "code";

    String urlDireccion = url +
        "?client_id=${global.id_client}" +
        "&response_type=$responseType" +
        "&redirect_uri=$redirectUri" +
        "&scope=$scope";

    try {
      final response = await FlutterWebAuth.authenticate(
          url: urlDireccion, callbackUrlScheme: 'spotify');

      final error = Uri.parse(response).queryParameters['error'];
      if (error == null) {
        final code = Uri.parse(response).queryParameters['code'];
        AlertController.show(
            "Successful authentication",
            "Be properly authenticated with your spotify account!",
            TypeAlert.success);
        getAccesToken(code.toString());
        return code;
      } else {
        AlertController.show(
            "Failed authentication",
            "Not successfully authenticated with your Spotify account!",
            TypeAlert.error);
        change(null, status: RxStatus.success());
        return error;
      }
    } catch (error) {
      AlertController.show(
          "Failed authentication",
          "Not successfully authenticated with your Spotify account!",
          TypeAlert.error);
      change(null, status: RxStatus.success());
      return error;
    }
  }

  getAccesToken(String code) async {
    String urlBase = 'accounts.spotify.com';

    Uri urlToToken = Uri.https(urlBase, '/api/token');

    var response = await http.post(urlToToken, body: {
      'grant_type': "authorization_code",
      'code': code,
      'redirect_uri': 'spotify://spotify'
    }, headers: {
      'Authorization':
          formatHeaderOfAuthorization(global.id_client, global.client_secret)
    });
    print(response.body);
    await saveInformationOfTOken(response.body);
    change(null, status: RxStatus.success());
    Get.toNamed(Routes.MENU);
  }

  saveInformationOfTOken(String responseBody) async {
    final localStorage = await SharedPreferences.getInstance();

    var token = TokenModel.fromJson(responseBody).accessToken;
    var tokenExpired = TokenModel.fromJson(responseBody).expiresIn;
    var tokenType = TokenModel.fromJson(responseBody).tokenType;
    var tokenRefresh = TokenModel.fromJson(responseBody).refreshToken;
    var tokenScope = TokenModel.fromJson(responseBody).scope;

    localStorage.setString('token', token);
    localStorage.setInt('tokenExpired', tokenExpired);
    localStorage.setString('tokenType', tokenType);
    localStorage.setString('tokenRefres', tokenRefresh);
    localStorage.setString('tokenScope', tokenScope);
  }

  String formatHeaderOfAuthorization(String idClient, String secretClient) {
    String authorizationStr = "$idClient:$secretClient";
    var bytes = utf8.encode(authorizationStr);
    var base64Str = base64.encode(bytes);
    String headerAuthorization = 'Basic ' + base64Str;
    return headerAuthorization;
  }
}
