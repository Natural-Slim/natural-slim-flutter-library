import 'meal_type_model.dart';

class MealModel {
    MealModel({
        required this.name,
        required this.mealTypeId,
        required this.isDefault,
        required this.mealType,
    });

    String name;
    int mealTypeId;
    bool isDefault;
    MealTypeModel mealType;

    factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        name: json["name"],
        mealTypeId: json["mealTypeId"],
        isDefault: json["isDefault"],
        mealType: MealTypeModel.fromJson(json["mealType"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mealTypeId": mealTypeId,
        "isDefault": isDefault,
        "mealType": mealType.toJson(),
    };
}