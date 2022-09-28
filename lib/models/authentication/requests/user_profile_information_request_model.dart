import 'dart:convert';

UserProfileInformationRequestModel userProfileInformationRequestModelFromJson(String str) => UserProfileInformationRequestModel.fromJson(json.decode(str));

String userProfileInformationRequestModelToJson(UserProfileInformationRequestModel data) => json.encode(data.toJson());

class UserProfileInformationRequestModel {
  UserProfileInformationRequestModel({
    this.phoneNumber,
    required this.firstName,
    this.lastName,
    this.photo,
  });

  String? phoneNumber;
  String firstName;
  String? lastName;
  String? photo;

  factory UserProfileInformationRequestModel.fromJson(Map<String, dynamic> json) => UserProfileInformationRequestModel(
    phoneNumber: json["phoneNumber"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "firstName": firstName,
    "lastName": lastName,
    "photo": photo,
  };
}