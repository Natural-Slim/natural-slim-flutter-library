import 'dart:convert';

class UserProfileInformationResponseModel {
    UserProfileInformationResponseModel({
        this.memberId,
        this.userName,
        this.email,
        this.phoneNumber,
        this.firstName,
        this.lastName,
        this.photo,
        this.registered,
    });

    String? memberId;
    String? userName;
    String? email;
    String? phoneNumber;
    String? firstName;
    String? lastName;
    String? photo;
    String? registered;

    UserProfileInformationResponseModel userProfileInformationResponseModelFromJson(String str) => UserProfileInformationResponseModel.fromJson(json.decode(str));

    String userProfileInformationResponseModelToJson(UserProfileInformationResponseModel data) => json.encode(data.toJson());

    factory UserProfileInformationResponseModel.fromJson(Map<String, dynamic> json) => UserProfileInformationResponseModel(
        memberId: json["memberId"],
        userName: json["userName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        photo: json["photo"],
        registered: json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "memberId": memberId,
        "userName": userName,
        "email": email,
        "phoneNumber": phoneNumber,
        "firstName": firstName,
        "lastName": lastName,
        "photo": photo,
        "registered": registered,
    };
}
