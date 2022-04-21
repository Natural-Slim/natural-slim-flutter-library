// To parse this JSON data, do
//
//     final adsourcesResponseModel = adsourcesResponseModelFromJson(jsonString);

import 'dart:convert';

class AdsourcesResponseModel {
  AdsourcesResponseModel({
    required this.adid,
    required this.name,
  });

  int adid;
  String name;

  static List<AdsourcesResponseModel> adsourcesResponseModelFromJson(String str) => List<AdsourcesResponseModel>.from(json.decode(str).map((x) => AdsourcesResponseModel.fromJson(x)));

  static String adsourcesResponseModelToJson(List<AdsourcesResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory AdsourcesResponseModel.fromJson(Map<String, dynamic> json) => AdsourcesResponseModel(
    adid: json["adid"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "adid": adid,
    "name": name,
  };
}
