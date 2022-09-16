import 'dart:convert';

import 'user_product_dosage.dart';
import 'products_response_model.dart';

class UserProductResponseModel {
  UserProductResponseModel({
    required this.id,
    required this.inUse,
    this.comments,
    required this.product,
    required this.userProductDosages,
  });

  int id;
  bool inUse;
  String? comments;
  ProductsResponseModel product;
  List<UserProductDosage> userProductDosages;

  static List<UserProductResponseModel> userProductsResponseModelFromJson(String str) => List<UserProductResponseModel>.from(json.decode(str).map((x) => UserProductResponseModel.fromJson(x)));

  static String userProductsResponseModelToJson(List<UserProductResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory UserProductResponseModel.fromJson(Map<String, dynamic> json) => UserProductResponseModel(
    id: json["id"],
    inUse: json["inUse"],
    comments: json["comments"],
    product: ProductsResponseModel.fromJson(json["product"]),
    userProductDosages: List<UserProductDosage>.from(json["userProductDosages"].map((x) => UserProductDosage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "inUse": inUse,
    "comments": comments,
    "product": product.toJson(),
    "userProductDosages": List<dynamic>.from(userProductDosages.map((x) => x.toJson())),
  };
}
