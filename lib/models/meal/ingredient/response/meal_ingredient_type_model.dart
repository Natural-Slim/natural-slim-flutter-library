class MealIngredientTypeModel {
  MealIngredientTypeModel({
    required this.id,
    this.name,
    this.image
  });

  int id;
  String? name;
  String? image;

  factory MealIngredientTypeModel.fromJson(Map<String, dynamic> json) => MealIngredientTypeModel(
      id: json["id"],
      name: json["name"] ?? "",
      image: json["name"] ?? "",
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "image": image
  };
}