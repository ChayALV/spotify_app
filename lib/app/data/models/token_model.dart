import 'dart:convert';

class TokenModel {
    TokenModel({
      required  this.accessToken,
      required  this.tokenType,
      required  this.expiresIn,
      required  this.refreshToken,
      required  this.scope,
    });

    String accessToken;
    String tokenType;
    int expiresIn;
    String refreshToken;
    String scope;

    factory TokenModel.fromJson(String str) => TokenModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        scope: json["scope"],
    );

    Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "scope": scope,
    };
}
