// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

class LoginResponseModel {
    LoginResponseModel({
      required this.username,
      required this.roles,
      required this.token,
      required this.memberId,
      this.memberGuid,
      required this.tokenExpiration,
      required this.hasLogged,
    });

    String username;
    List<String> roles;
    String token;
    String memberId;
    String? memberGuid;
    DateTime tokenExpiration;
    bool hasLogged;

    factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        username: json["username"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        token: json["token"],
        memberId: json["memberId"],
        memberGuid: json["memberGuid"],
        tokenExpiration: DateTime.parse(json["tokenExpiration"]),
        hasLogged: json["hasLogged"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "roles": List<dynamic>.from(roles.map((x) => x)),
        "token": token,
        "memberId": memberId,
        "memberGuid": memberGuid,
        "tokenExpiration": tokenExpiration.toIso8601String(),
        "hasLogged": hasLogged,
    };
}
