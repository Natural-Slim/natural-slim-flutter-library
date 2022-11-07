class UserPasswordRequestModel {
  UserPasswordRequestModel({
    required this.newPassword,
    required this.newPasswordConfirm,
    required this.currentPassword,
  });

  String newPassword;
  String newPasswordConfirm;
  String currentPassword;

  factory UserPasswordRequestModel.fromJson(Map<String, dynamic> json) => UserPasswordRequestModel(
    newPassword: json["newPassword"],
    newPasswordConfirm: json["newPasswordConfirm"],
    currentPassword: json["currentPassword"],
  );

  Map<String, dynamic> toJson() => {
    "newPassword": newPassword,
    "newPasswordConfirm": newPasswordConfirm,
    "currentPassword": currentPassword,
  };
}
