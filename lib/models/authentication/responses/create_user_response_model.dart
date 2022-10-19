class CreateUserResponseModel {
  CreateUserResponseModel({
    this.memberId,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.registered,
  });

  String? memberId;
  String userName;
  String email;
  String phoneNumber;
  String firstName;
  String lastName;
  String photo;
  DateTime registered;

  factory CreateUserResponseModel.fromJson(Map<String, dynamic> json) => CreateUserResponseModel(
    memberId: json["memberId"],
    userName: json["userName"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    photo: json["photo"],
    registered: DateTime.parse(json["registered"]),
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "userName": userName,
    "email": email,
    "phoneNumber": phoneNumber,
    "firstName": firstName,
    "lastName": lastName,
    "photo": photo,
    "registered": registered.toIso8601String(),
  };
}
