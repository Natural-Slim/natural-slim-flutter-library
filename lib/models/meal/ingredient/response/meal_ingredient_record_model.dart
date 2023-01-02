import 'meal_ingredient_type_model.dart';

class MealIngredientRecordModel {
  MealIngredientRecordModel({
    required this.name,
    this.commentary,
    required this.amount,
    required this.amountUnit,
    required this.carbohydratesAmount,
    required this.carbohydratesUnit,
    required this.caloriesAmount,
    required this.caloriesUnit,
    required this.ingredientType,
  });

  String name;
  String? commentary;
  int amount;
  String amountUnit;
  int carbohydratesAmount;
  String carbohydratesUnit;
  int caloriesAmount;
  String caloriesUnit;
  MealIngredientTypeModel ingredientType;

  factory MealIngredientRecordModel.fromJson(Map<String, dynamic> json) => MealIngredientRecordModel(
    name: json["name"],
    commentary: json["commentary"],
    amount: json["amount"],
    amountUnit: json["amountUnit"],
    carbohydratesAmount: json["carbohydratesAmount"],
    carbohydratesUnit: json["carbohydratesUnit"],
    caloriesAmount: json["caloriesAmount"],
    caloriesUnit: json["caloriesUnit"],
    ingredientType: MealIngredientTypeModel.fromJson(json["ingredientType"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "commentary": commentary,
    "amount": amount,
    "amountUnit": amountUnit,
    "carbohydratesAmount": carbohydratesAmount,
    "carbohydratesUnit": carbohydratesUnit,
    "caloriesAmount": caloriesAmount,
    "caloriesUnit": caloriesUnit,
    "ingredientType": ingredientType.toJson(),
  };
}
