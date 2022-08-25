class LoginResponseModel {
  LoginResponseModel({
    required this.username,
    required this.authToken,
    required this.authTokenExpirationInMin,
    required this.refreshToken,
    required this.refreshTokenExpirationInDays,
    required this.hasLogged,
  });

  String username;
  String authToken;
  int authTokenExpirationInMin;
  String refreshToken;
  int refreshTokenExpirationInDays;
  bool hasLogged;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    username: json["username"],
    authToken: json["authToken"],
    authTokenExpirationInMin: json["authTokenExpirationInMin"],
    refreshToken: json["refreshToken"],
    refreshTokenExpirationInDays: json["refreshTokenExpirationInDays"],
    hasLogged: json["hasLogged"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "authToken": authToken,
    "authTokenExpirationInMin": authTokenExpirationInMin,
    "refreshToken": refreshToken,
    "refreshTokenExpirationInDays": refreshTokenExpirationInDays,
    "hasLogged": hasLogged,
  };
}
