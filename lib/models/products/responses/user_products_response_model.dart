import 'dart:convert';

import '../user_product_dosage.dart';
import 'products_response_model.dart';

class UserProductsResponseModel {
  UserProductsResponseModel({
    required this.id,
    required this.inUse,
    this.description,
    required this.product,
    required this.userProductDosages,
  });

  int id;
  bool inUse;
  String? description;
  ProductsResponseModel product;
  List<UserProductDosage> userProductDosages;

  static List<UserProductsResponseModel> userProductsResponseModelFromJson(String str) => List<UserProductsResponseModel>.from(json.decode(str).map((x) => UserProductsResponseModel.fromJson(x)));

  static String userProductsResponseModelToJson(List<UserProductsResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory UserProductsResponseModel.fromJson(Map<String, dynamic> json) => UserProductsResponseModel(
    id: json["id"],
    inUse: json["inUse"],
    description: json["description"],
    product: ProductsResponseModel.fromJson(json["product"]),
    userProductDosages: List<UserProductDosage>.from(json["userProductDosages"].map((x) => UserProductDosage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inUse": inUse,
    "description": description,
    "product": product.toJson(),
    "userProductDosages": List<dynamic>.from(userProductDosages.map((x) => x.toJson())),
  };
}
