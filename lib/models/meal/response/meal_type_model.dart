import 'package:flutter/material.dart';

class MealTypeModel {
  MealTypeModel({
      required this.id,
      required this.name,
      required this.start,
      required this.end,
  });

  int id;
  String name;
  TimeOfDay start;
  TimeOfDay end;

  factory MealTypeModel.fromJson(Map<String, dynamic> json) => MealTypeModel(
      id: json["id"],
      name: json["name"],
      start: TimeOfDay(hour: int.parse(json["start"].toString().split(':')[0]), minute: int.parse(json["start"].toString().split(':')[1])),
      end: TimeOfDay(hour: int.parse(json["end"].toString().split(':')[0]), minute: int.parse(json["end"].toString().split(':')[1])),
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "start": start,
      "end": end,
  };
}