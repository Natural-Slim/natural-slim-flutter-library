import 'dart:convert';

import 'package:natural_slim_flutter_library/utils/enums/dosage_enum.dart';

class ProductAvailableDosageModel {
  ProductAvailableDosageModel({
    required this.dosage,
  });

  Dosage dosage;
  
  static List<ProductAvailableDosageModel> productAvailableDosageFromJson(String str) => List<ProductAvailableDosageModel>.from(json.decode(str).map((x) => ProductAvailableDosageModel.fromJson(x)));

  static String productAvailableDosageToJson(List<ProductAvailableDosageModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  factory ProductAvailableDosageModel.fromJson(Map<String, dynamic> json) => ProductAvailableDosageModel(
    dosage: DosageExtension.getValue(json["dosage"])!,
  );

  Map<String, dynamic> toJson() => {
    "dosage": dosage,
  };
}
