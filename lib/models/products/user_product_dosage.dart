import '../../utils/enums/dosage_enum.dart';

class UserProductDosage {
  UserProductDosage({
    required this.value,
    this.dosage,
    required this.userProductId,
  });

  String value;
  Dosage? dosage;
  int userProductId;

  factory UserProductDosage.fromJson(Map<String, dynamic> json) => UserProductDosage(
    value: json["value"],
    dosage: DosageExtension.getValue(json["dosage"]),
    userProductId: json["userProductId"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "dosage": dosage!.name,
    "userProductId": userProductId,
  };
}