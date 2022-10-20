class CreateUserRequestModel {
  CreateUserRequestModel({
    this.memberId,
    required this.userName,
    required this.password,
    required this.email,
    required this.areaCode,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
  });

  String? memberId;
  String userName;
  String password;
  String email;
  String areaCode;
  String phoneNumber;
  String firstName;
  String lastName;

  factory CreateUserRequestModel.fromJson(Map<String, dynamic> json) => CreateUserRequestModel(
    memberId: json["memberId"],
    userName: json["userName"],
    password: json["password"],
    email: json["email"],
    areaCode: json["areaCode"],
    phoneNumber: json["phoneNumber"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "userName": userName,
    "password": password,
    "email": email,
    "areaCode": areaCode,
    "phoneNumber": phoneNumber,
    "firstName": firstName,
    "lastName": lastName,
  };
}
