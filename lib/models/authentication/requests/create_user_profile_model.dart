class CreateUserRequestModel {
  CreateUserRequestModel({
    this.memberId,
    required this.userName,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
  });

  String? memberId;
  String userName;
  String password;
  String email;
  String phoneNumber;
  String firstName;
  String lastName;

  factory CreateUserRequestModel.fromJson(Map<String, dynamic> json) => CreateUserRequestModel(
    memberId: json["memberId"],
    userName: json["userName"],
    password: json["password"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    firstName: json["firstName"],
    lastName: json["lastName"],
  );

  Map<String, dynamic> toJson() => {
    "memberId": memberId,
    "userName": userName,
    "password": password,
    "email": email,
    "phoneNumber": phoneNumber,
    "firstName": firstName,
    "lastName": lastName,
  };
}
