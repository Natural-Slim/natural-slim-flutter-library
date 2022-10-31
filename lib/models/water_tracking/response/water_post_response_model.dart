import '../../measure_unit_model.dart';

class WaterPostResponseModel {
  WaterPostResponseModel({
      required this.id,
      required this.amount,
      this.comment,
      required this.measureUnit,
      required this.registered,
  });

  int id;
  double amount;
  String? comment;
  MeasureUnitModel measureUnit;
  DateTime registered;

  factory WaterPostResponseModel.fromJson(Map<String, dynamic> json) => WaterPostResponseModel(
      id: json["id"],
      amount: json["amount"],
      comment: json["comment"],
      measureUnit: MeasureUnitModel.fromJson(json["measureUnit"]),
      registered: DateTime.parse(json["registered"]),
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "amount": amount,
      "comment": comment,
      "measureUnit": measureUnit.toJson(),
      "registered": registered.toIso8601String(),
  };
}