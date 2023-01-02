class MealIngredientTypeModel {
  MealIngredientTypeModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory MealIngredientTypeModel.fromJson(Map<String, dynamic> json) => MealIngredientTypeModel(
      id: json["id"],
      name: json["name"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
}