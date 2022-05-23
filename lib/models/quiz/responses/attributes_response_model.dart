// To parse this JSON data, do
//
//     final attributesResponseModel = attributesResponseModelFromJson(jsonString);

import 'dart:convert';

class AttributesResponseModel {
  AttributesResponseModel({
    required this.id,
    required this.title,
    this.status,
  });

  int id;
  String title;
  bool? status;

  static List<AttributesResponseModel> attributesResponseModelFromJson(String str) => List<AttributesResponseModel>.from(json.decode(str).map((x) => AttributesResponseModel.fromJson(x)));

  static String attributesResponseModelToJson(List<AttributesResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory AttributesResponseModel.fromJson(Map<String, dynamic> json) => AttributesResponseModel(
    id: json["id"],
    title: json["title"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "status": status,
  };
}
