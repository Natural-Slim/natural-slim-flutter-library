// To parse this JSON data, do
//
//     final authenticationRequest = authenticationRequestFromJson(jsonString);

import 'dart:convert';

LoginRequestModel authenticationRequestFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String authenticationRequestToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
    LoginRequestModel({
      required this.username,
      required this.password,
    });

    String username;
    String password;

    factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
