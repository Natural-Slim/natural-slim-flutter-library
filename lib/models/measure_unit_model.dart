import 'measure_unit_type_model.dart';

class MeasureUnitModel {
  MeasureUnitModel({
    required this.id,
    required this.unit,
    required this.abbreviation,
    this.conversionFactor,
    this.measureUnitType,
  });

  int id;
  String unit;
  String abbreviation;
  double? conversionFactor;
  MeasureUnitType? measureUnitType;

  factory MeasureUnitModel.fromJson(Map<String, dynamic> json) => MeasureUnitModel(
    id: json["id"],
    unit: json["unit"],
    abbreviation: json["abbreviation"],
    conversionFactor : json["conversionFactor"] == null ? null : double.parse(json["conversionFactor"].toString()),
    measureUnitType: json["measureUnitType"] == null ? null : MeasureUnitType.fromJson(json["measureUnitType"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "abbreviation": abbreviation,
    "conversionFactor": conversionFactor,
    "measureUnitType": measureUnitType == null ? null : measureUnitType!.toJson(),
  };
}