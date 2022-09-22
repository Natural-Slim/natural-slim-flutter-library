// To parse this JSON data, do
//
//     final coursesResponseModel = coursesResponseModelFromJson(jsonString);

import 'dart:convert';

class CoursesResponseModel {
  CoursesResponseModel({
    required this.id,
    required this.name,
    this.description,
    this.price,
    required this.photo,
    required this.url
  });

  int id;
  String name;
  String? description;
  double? price;
  String photo;
  String url;

  static List<CoursesResponseModel> coursesResponseModelFromJson(String str) => List<CoursesResponseModel>.from(json.decode(str).map((x) => CoursesResponseModel.fromJson(x)));

  static String coursesResponseModelToJson(List<CoursesResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory CoursesResponseModel.fromJson(Map<String, dynamic> json) => CoursesResponseModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    photo: json["photo"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "photo": photo,
    "url": url,
  };
}
