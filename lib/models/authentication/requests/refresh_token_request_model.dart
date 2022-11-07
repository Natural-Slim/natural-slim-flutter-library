class RefreshTokenRequestModel {
  RefreshTokenRequestModel({
    required this.authToken,
    required this.refreshToken,
  });

  String authToken;
  String refreshToken;

  factory RefreshTokenRequestModel.fromJson(Map<String, dynamic> json) => RefreshTokenRequestModel(
    authToken: json["authToken"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "authToken": authToken,
    "refreshToken": refreshToken,
  };
}
