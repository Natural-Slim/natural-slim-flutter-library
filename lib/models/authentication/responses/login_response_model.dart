// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
    LoginResponseModel({
      required this.username,
      required this.roles,
      required this.token,
      required this.memberId,
      this.memberGuid,
      required this.tokenExpiration,
    });

    String username;
    List<String> roles;
    String token;
    String memberId;
    String? memberGuid;
    DateTime tokenExpiration;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        username: json["username"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        token: json["token"],
        memberId: json["memberId"],
        memberGuid: json["memberGuid"],
        tokenExpiration: DateTime.parse(json["tokenExpiration"]),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "token": token,
        "memberId": memberId,
        "memberGuid": memberGuid,
        "tokenExpiration": tokenExpiration.toIso8601String(),
    };
}
