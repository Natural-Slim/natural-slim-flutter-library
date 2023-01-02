import 'dart:convert';

import 'package:natural_slim_flutter_library/models/meal/ingredient/response/paginated_meal_ingredient_date_record_model.dart';

class MealIngredientResponseModel {
  MealIngredientResponseModel({
      required this.count,
      required this.paginatedRecords,
  });

  int count;
  PaginatedMealIngredientDateRecordsModel paginatedRecords;

  static MealIngredientResponseModel mealIngredientResponseModelFromJson(String str) => MealIngredientResponseModel.fromJson(json.decode(str));

  static String mealIngredientResponseModelToJson(MealIngredientResponseModel data) => json.encode(data.toJson());

  factory MealIngredientResponseModel.fromJson(Map<String, dynamic> json) => MealIngredientResponseModel(
      count: json["count"],
      paginatedRecords: PaginatedMealIngredientDateRecordsModel.fromJson(json["paginatedRecords"]),
  );

  Map<String, dynamic> toJson() => {
      "count": count,
      "paginatedRecords": paginatedRecords.toJson(),
  };
}

