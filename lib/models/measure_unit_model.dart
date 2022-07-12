class MeasureUnitModel {
  MeasureUnitModel({
    required this.id,
    required this.unit,
    this.measureUnitType,
  });

  int id;
  String unit;
  String? measureUnitType;

  factory MeasureUnitModel.fromJson(Map<String, dynamic> json) => MeasureUnitModel(
    id: json["id"],
    unit: json["unit"],
    measureUnitType: json["measureUnitType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "measureUnitType": measureUnitType,
  };
}