// To parse this JSON data, do
//
//     final attributeEntryResponseModel = attributeEntryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:natural_slim_flutter_library/models/quiz/responses/attributes_response_model.dart';

class AttributeEntryResponseModel {
  AttributeEntryResponseModel({
    required this.entry,
    required this.response,
    required this.attributes,
  });

  Entry entry;
  String response;
  List<AttributesResponseModel> attributes;

  static AttributeEntryResponseModel attributeEntryResponseModelFromJson(String str) => AttributeEntryResponseModel.fromJson(json.decode(str));

  static String attributeEntryResponseModelToJson(AttributeEntryResponseModel data) => json.encode(data.toJson());

  factory AttributeEntryResponseModel.fromJson(Map<String, dynamic> json) => AttributeEntryResponseModel(
    entry: Entry.fromJson(json["entry"]),
    response: json["response"],
    attributes: List<AttributesResponseModel>.from(json["attributes"].map((x) => AttributesResponseModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "entry": entry.toJson(),
    "response": response,
    "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
  };
}

class Entry {
  Entry({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
