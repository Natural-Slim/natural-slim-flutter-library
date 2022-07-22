// To parse this JSON data, do
//
//     final userSettingsRequestModel = userSettingsRequestModelFromJson(jsonString);

import 'dart:convert';

class UserSettingsRequestModel {
  UserSettingsRequestModel({
    required this.darkMode,
    required this.countryId,
    this.locationId,
    required this.membersLanguageId,
    required this.lengthMeasureUnitId,
    required this.weightMeasureUnitId,
    required this.capacityMeasureUnitId,
    required this.showNotifications,
    required this.eventNotifications,
    required this.waterGoalsNotifications,
    required this.mealGoalsNotifications,
    required this.excerciseGoalsNotifications,
    required this.consultingChatNotifications,
    required this.consultingAppointmentNotifications,
  });

  bool darkMode;
  int countryId;
  int? locationId;
  int membersLanguageId;
  int lengthMeasureUnitId;
  int weightMeasureUnitId;
  int capacityMeasureUnitId;
  bool showNotifications;
  bool eventNotifications;
  bool waterGoalsNotifications;
  bool mealGoalsNotifications;
  bool excerciseGoalsNotifications;
  bool consultingChatNotifications;
  bool consultingAppointmentNotifications;
  
  static UserSettingsRequestModel userSettingsRequestModelFromJson(String str) => UserSettingsRequestModel.fromJson(json.decode(str));

  static String userSettingsRequestModelToJson(UserSettingsRequestModel data) => json.encode(data.toJson());

  factory UserSettingsRequestModel.fromJson(Map<String, dynamic> json) => UserSettingsRequestModel(
    darkMode: json["darkMode"],
    countryId: json["countryId"],
    locationId: json["locationId"],
    membersLanguageId: json["membersLanguageId"],
    lengthMeasureUnitId: json["lengthMeasureUnitId"],
    weightMeasureUnitId: json["weightMeasureUnitId"],
    capacityMeasureUnitId: json["capacityMeasureUnitId"],
    showNotifications: json["showNotifications"],
    eventNotifications: json["eventNotifications"],
    waterGoalsNotifications: json["waterGoalsNotifications"],
    mealGoalsNotifications: json["mealGoalsNotifications"],
    excerciseGoalsNotifications: json["excerciseGoalsNotifications"],
    consultingChatNotifications: json["consultingChatNotifications"],
    consultingAppointmentNotifications: json["consultingAppointmentNotifications"],
  );

  Map<String, dynamic> toJson() => {
    "darkMode": darkMode,
    "countryId": countryId,
    "locationId": locationId,
    "membersLanguageId": membersLanguageId,
    "lengthMeasureUnitId": lengthMeasureUnitId,
    "weightMeasureUnitId": weightMeasureUnitId,
    "capacityMeasureUnitId": capacityMeasureUnitId,
    "showNotifications": showNotifications,
    "eventNotifications": eventNotifications,
    "waterGoalsNotifications": waterGoalsNotifications,
    "mealGoalsNotifications": mealGoalsNotifications,
    "excerciseGoalsNotifications": excerciseGoalsNotifications,
    "consultingChatNotifications": consultingChatNotifications,
    "consultingAppointmentNotifications": consultingAppointmentNotifications,
  };
}
