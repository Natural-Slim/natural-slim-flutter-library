// To parse this JSON data, do
//
//     final geoLocationResponseModel = geoLocationResponseModelFromJson(jsonString);

import 'dart:convert';

class GeoLocationResponseModel {
  GeoLocationResponseModel({
    this.countryCode,
    this.countryName,
    this.city,
    this.postal,
    this.latitude,
    this.longitude,
    this.iPv4,
    this.state,
  });

  String? countryCode;
  String? countryName;
  String? city;
  int? postal;
  double? latitude;
  double? longitude;
  String? iPv4;
  String? state;

  static GeoLocationResponseModel geoLocationResponseModelFromJson(String str) => GeoLocationResponseModel.fromJson(json.decode(str));

  static String geoLocationResponseModelToJson(GeoLocationResponseModel data) => json.encode(data.toJson());

  factory GeoLocationResponseModel.fromJson(Map<String, dynamic> json) => GeoLocationResponseModel(
    countryCode: json["country_code"],
    countryName: json["country_name"],
    city: json["city"],
    postal: json["postal"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    iPv4: json["IPv4"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "country_code": countryCode,
    "country_name": countryName,
    "city": city,
    "postal": postal,
    "latitude": latitude,
    "longitude": longitude,
    "IPv4": iPv4,
    "state": state,
  };
}
