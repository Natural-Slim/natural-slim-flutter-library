import 'dart:convert';

import 'package:natural_slim_flutter_library/models/meal/response/meal_model.dart';

class MealRequestModel {
  MealRequestModel({
    required this.mealId,
    required this.meal,
  });

  int mealId;
  MealModel meal;

  static MealRequestModel mealRequestModelFromJson(String str) => MealRequestModel.fromJson(json.decode(str));

  static String mealRequestModelToJson(MealRequestModel data) => json.encode(data.toJson());

  factory MealRequestModel.fromJson(Map<String, dynamic> json) => MealRequestModel(
      mealId: json["mealId"],
      meal: MealModel.fromJson(json["meal"]),
  );

  Map<String, dynamic> toJson() => {
      "mealId": mealId,
      "meal": meal.toJson(),
  };
}

