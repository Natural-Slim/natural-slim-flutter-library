// To parse this JSON data, do
//
//     final authenticationResponse = authenticationResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse authenticationResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String authenticationResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
      required this.username,
      required this.roles,
      required this.token,
      required this.memberId,
      this.memberGuid,
    });

    String username;
    List<String> roles;
    String token;
    String memberId;
    dynamic memberGuid;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        username: json["username"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        token: json["token"],
        memberId: json["memberId"],
        memberGuid: json["memberGuid"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "token": token,
        "memberId": memberId,
        "memberGuid": memberGuid,
    };
}
