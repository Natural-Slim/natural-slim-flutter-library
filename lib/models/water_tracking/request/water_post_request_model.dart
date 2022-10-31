
class WaterPostRequestModel {
  WaterPostRequestModel({
      required this.amount,
      required this.measureUnitId,
      this.comment,
      required this.registered,
  });

  double amount;
  int measureUnitId;
  String? comment;
  DateTime registered;

  factory WaterPostRequestModel.fromJson(Map<String, dynamic> json) => WaterPostRequestModel(
      amount: json["amount"],
      measureUnitId: json["measureUnitId"],
      comment: json["comment"],
      registered: json["registered"],
  );

  Map<String, dynamic> toJson() => {
      "amount": amount,
      "measureUnitId": measureUnitId,
      "comment": comment,
      "registered": registered.toIso8601String(),
  };
}