// To parse this JSON data, do
//
//     final authenticationRequest = authenticationRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest authenticationRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String authenticationRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    LoginRequest({
      required this.username,
      required this.password,
    });

    String username;
    String password;

    factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
