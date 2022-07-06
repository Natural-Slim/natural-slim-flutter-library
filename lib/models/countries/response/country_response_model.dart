// To parse this JSON data, do
//
//     final countryRegionsResponseModel = countryRegionsResponseModelFromJson(jsonString);

import 'dart:convert';

class CountryResponseModel {
    CountryResponseModel({
      required this.id,
      required this.isoCode,
      required this.countryCode,
      required this.name,
      required this.regions,
      required this.locations,
    });

    int id;
    String isoCode;
    String countryCode;
    String name;
    List<Region> regions;
    List<Location> locations;

    static List<CountryResponseModel> countryRegionsResponseModelFromJson(String str) => List<CountryResponseModel>.from(json.decode(str).map((x) => CountryResponseModel.fromJson(x)));

    static String countryRegionsResponseModelToJson(List<CountryResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

    factory CountryResponseModel.fromJson(Map<String, dynamic> json) => CountryResponseModel(
      id: json["id"],
      isoCode: json["isoCode"],
      countryCode: json["countryCode"],
      name: json["name"],
      regions: List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
      locations: List<Location>.from(json["locations"].map((x) => Location.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "isoCode": isoCode,
      "countryCode": countryCode,
      "name": name,
      "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
      "locations": List<dynamic>.from(locations.map((x) => x.toJson())),
    };
}

class Region {
  Region({
    required this.id,
    required this.name,
    required this.code,
  });

  int id;
  String name;
  String code;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}

class Location {
  Location({
    required this.id,
    required this.name,
    required this.code,
  });

  int id;
  String name;
  String code;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    name: json["name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "code": code,
  };
}
