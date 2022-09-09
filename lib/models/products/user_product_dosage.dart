class UserProductDosage {
  UserProductDosage({
    required this.value,
    required this.dosage,
    required this.userProductId,
  });

  String value;
  String dosage;
  int userProductId;

  factory UserProductDosage.fromJson(Map<String, dynamic> json) => UserProductDosage(
    value: json["value"],
    dosage: json["dosage"],
    userProductId: json["userProductId"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "dosage": dosage,
    "userProductId": userProductId,
  };
}