// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
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

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
