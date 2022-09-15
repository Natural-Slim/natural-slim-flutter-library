// To parse this JSON data, do
//
//     final dosageModel = dosageModelFromJson(jsonString);

import 'dart:convert';

class DosageModel {
  DosageModel({
    required this.value,
    required this.dosage,
  });

  double value;
  String dosage;

  static List<DosageModel> dosageModelFromJson(String str) => List<DosageModel>.from(json.decode(str).map((x) => DosageModel.fromJson(x)));

  static String dosageModelToJson(List<DosageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory DosageModel.fromJson(Map<String, dynamic> json) => DosageModel(
    value: json["value"],
    dosage: json["dosage"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "dosage": dosage,
  };
}
