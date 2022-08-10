import 'dart:convert';

UserProfileInformationRequestModel userProfileInformationRequestModelFromJson(String str) => UserProfileInformationRequestModel.fromJson(json.decode(str));

String userProfileInformationRequestModelToJson(UserProfileInformationRequestModel data) => json.encode(data.toJson());

class UserProfileInformationRequestModel {
    UserProfileInformationRequestModel({
        this.currentPassword,
        this.newPassword,
        this.email,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.photo,
    });

    String? currentPassword;
    String? newPassword;
    String? email;
    String? phoneNumber;
    String? firstName;
    String? lastName;
    String? photo;

    factory UserProfileInformationRequestModel.fromJson(Map<String, dynamic> json) => UserProfileInformationRequestModel(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "email": email,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        "photo": photo,
    };
}