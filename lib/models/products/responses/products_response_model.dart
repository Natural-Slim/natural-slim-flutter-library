import 'dart:convert';

import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';
import 'package:natural_slim_flutter_library/models/products/responses/product_available_dosage_model.dart';

class ProductsResponseModel {
  ProductsResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.photo,
    this.measureUnit,
    required this.productAvailableDosages,
  });

  int id;
  String name;
  String description;
  String photo;
  MeasureUnitModel? measureUnit;
  List<ProductAvailableDosageModel> productAvailableDosages;

  static List<ProductsResponseModel> productsDataResponseModelFromJson(String str) => List<ProductsResponseModel>.from(json.decode(str).map((x) => ProductsResponseModel.fromJson(x)));

  static String productsDataResponseModelToJson(List<ProductsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => ProductsResponseModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    photo: json["photo"],
    measureUnit: json["measureUnit"] == null ? null : MeasureUnitModel.fromJson(json["measureUnit"]),
    productAvailableDosages: ProductAvailableDosageModel.productAvailableDosageFromJson(jsonEncode(json["productAvailableDosages"])),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "photo": photo,
    "measureUnit": measureUnit,
    "productAvailableDosages": productAvailableDosages,
  };
}
