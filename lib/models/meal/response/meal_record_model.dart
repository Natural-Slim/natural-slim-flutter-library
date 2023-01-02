import 'meal_model.dart';

class MealRecordModel {
    MealRecordModel({
        required this.mealId,
        required this.userId,
        required this.meal,
        required this.hour,
    });

    int mealId;
    String userId;
    MealModel meal;
    DateTime hour;

    factory MealRecordModel.fromJson(Map<String, dynamic> json) => MealRecordModel(
        mealId: json["mealId"],
        userId: json["userId"],
        meal: MealModel.fromJson(json["meal"]),
        hour: DateTime.parse(json["hour"]),
    );

    Map<String, dynamic> toJson() => {
        "mealId": mealId,
        "userId": userId,
        "meal": meal.toJson(),
        "hour": hour.toIso8601String(),
    };
}