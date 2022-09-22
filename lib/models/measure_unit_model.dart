import 'measure_unit_type_model.dart';

class MeasureUnitModel {
  MeasureUnitModel({
    required this.id,
    required this.unit,
    required this.abbreviation,
    this.measureUnitType,
  });

  int id;
  String unit;
  String abbreviation;
  MeasureUnitType? measureUnitType;

  factory MeasureUnitModel.fromJson(Map<String, dynamic> json) => MeasureUnitModel(
    id: json["id"],
    unit: json["unit"],
    abbreviation: json["abbreviation"],
    measureUnitType: json["measureUnitType"] == null ? null : MeasureUnitType.fromJson(json["measureUnitType"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "abbreviation": abbreviation,
    "measureUnitType": measureUnitType == null ? null : measureUnitType!.toJson(),
  };
}