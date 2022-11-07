class UserProfileInformationResponseModel {
  UserProfileInformationResponseModel({
    required this.memberId,
    required this.userName,
    required this.email,
    this.phoneNumber,
    required this.firstName,
    this.lastName,
    required this.photo,
    required this.registered,
  });

  String memberId;
  String userName;
  String email;
  String? phoneNumber;
  String firstName;
  String? lastName;
  String photo;
  String registered;

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
