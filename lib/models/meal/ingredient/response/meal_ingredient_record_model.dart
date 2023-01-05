import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';

import 'meal_ingredient_type_model.dart';

class MealIngredientRecordModel {
  MealIngredientRecordModel({
    required this.id,
    this.name,
    this.commentary,
    required this.amount,
    required this.amountMeasureUnitId,
    required this.carbohydratesAmount,
    this.carbohydratesMeasureUnit,
    required this.caloriesAmount,
    this.caloriesMeasureUnit,
    required this.ingredientTypeId,
    required this.amountMeasureUnit,
    required this.ingredientType,

  });

  int id;
  String? name;
  String? commentary;
  int amount;
  int amountMeasureUnitId;
  double carbohydratesAmount;
  String? carbohydratesMeasureUnit;
  double caloriesAmount;
  String? caloriesMeasureUnit;
  int ingredientTypeId;
  MeasureUnitModel amountMeasureUnit;
  MealIngredientTypeModel ingredientType;

  factory MealIngredientRecordModel.fromJson(Map<String, dynamic> json) => MealIngredientRecordModel(
    id: json["id"],
    name: json["name"],
    commentary: json["commentary"],
    amount: json["amount"],
    amountMeasureUnitId: json["amountMeasureUnitId"],
    carbohydratesAmount: double.parse(json["carbohydratesAmount"].toString()),
    carbohydratesMeasureUnit: json["carbohydratesMeasureUnit"],
    caloriesAmount: double.parse(json["caloriesAmount"].toString()),
    caloriesMeasureUnit: json["caloriesMeasureUnit"],
    ingredientTypeId: json["ingredientTypeId"],
    amountMeasureUnit: MeasureUnitModel.fromJson(json["amountMeasureUnit"]),
    ingredientType: MealIngredientTypeModel.fromJson(json["ingredientType"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "commentary": commentary,
    "amount": amount,
    "amountMeasureUnitId": amountMeasureUnitId,
    "carbohydratesAmount": carbohydratesAmount,
    "carbohydratesMeasureUnit": carbohydratesMeasureUnit,
    "caloriesAmount": caloriesAmount,
    "caloriesMeasureUnit": caloriesMeasureUnit,
    "ingredientTypeId": ingredientTypeId,
    "amountMeasureUnit": amountMeasureUnit,
    "ingredientType": ingredientType.toJson(),
  };
}
