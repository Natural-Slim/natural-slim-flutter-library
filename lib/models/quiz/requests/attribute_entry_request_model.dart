// To parse this JSON data, do
//
//     final entryRequestModel = entryRequestModelFromJson(jsonString);

import 'dart:convert';

class AttributeEntryRequestModel {

  AttributeEntryRequestModel({
    required this.age,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.ipcountryname,
    required this.iplocation,
    required this.ipclient,
    required this.region,
    required this.type,
    required this.appLang,
    required this.adSource,
    required this.optInMarketing,
    required this.attributeId,
    required this.edate,
  });

  String? age;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? ipcountryname;
  String? iplocation;
  String? ipclient;
  String? region;
  String? type;
  String? appLang;
  int? adSource;
  int? optInMarketing;
  List<int>? attributeId;
  DateTime? edate;
  
  static AttributeEntryRequestModel entryRequestModelFromJson(String str) => AttributeEntryRequestModel.fromJson(json.decode(str));

  static String entryRequestModelToJson(AttributeEntryRequestModel data) => json.encode(data.toJson());

  factory AttributeEntryRequestModel.fromJson(Map<String, dynamic> json) => AttributeEntryRequestModel(
    age: json["age"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    ipcountryname: json["ipcountryname"],
    iplocation: json["iplocation"],
    ipclient: json["ipclient"],
    region: json["region"],
    type: json["type"],
    appLang: json["appLang"],
    adSource: json["adSource"],
    optInMarketing: json["optInMarketing"],
    attributeId: List<int>.from(json["attributeId"].map((x) => x)),
    edate: DateTime.parse(json["edate"]),
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "ipcountryname": ipcountryname,
    "iplocation": iplocation,
    "ipclient": ipclient,
    "region": region,
    "type": type,
    "appLang": appLang,
    "adSource": adSource,
    "optInMarketing": optInMarketing,
    "attributeId": List<dynamic>.from(attributeId!.map((x) => x)),
    "edate": edate!.toIso8601String(),
  };
}
