// To parse this JSON data, do
//
//     final userSettingsResponseModel = userSettingsResponseModelFromJson(jsonString);

import 'package:natural_slim_flutter_library/models/countries/response/country_response_model.dart';
import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';
import 'package:natural_slim_flutter_library/models/members_language_model.dart';

class UserSettingsResponseModel {
  UserSettingsResponseModel({
    required this.darkMode,
    required this.showNotifications,
    required this.eventNotifications,
    required this.waterGoalsNotifications,
    required this.mealGoalsNotifications,
    required this.excerciseGoalsNotifications,
    required this.consultingChatNotifications,
    required this.consultingAppointmentNotifications,
    required this.lengthMeasureUnit,
    required this.weightMeasureUnit,
    required this.capacityMeasureUnit,
    required this.country,
    required this.location,
    required this.membersLanguage,
  });

  bool darkMode;
  bool showNotifications;
  bool eventNotifications;
  bool waterGoalsNotifications;
  bool mealGoalsNotifications;
  bool excerciseGoalsNotifications;
  bool consultingChatNotifications;
  bool consultingAppointmentNotifications;
  MeasureUnitModel lengthMeasureUnit;
  MeasureUnitModel weightMeasureUnit;
  MeasureUnitModel capacityMeasureUnit;
  CountryResponseModel country;
  Location location;
  MembersLanguageModel membersLanguage; 

  // static UserSettingsResponseModel userSettingsResponseModelFromJson(String str) => UserSettingsResponseModel.fromJson(json.decode(str));

  // static String userSettingsResponseModelToJson(UserSettingsResponseModel data) => json.encode(data.toJson());

  factory UserSettingsResponseModel.fromJson(Map<String, dynamic> json) => UserSettingsResponseModel(
    darkMode: json["darkMode"],
    showNotifications: json["showNotifications"],
    eventNotifications: json["eventNotifications"],
    waterGoalsNotifications: json["waterGoalsNotifications"],
    mealGoalsNotifications: json["mealGoalsNotifications"],
    excerciseGoalsNotifications: json["excerciseGoalsNotifications"],
    consultingChatNotifications: json["consultingChatNotifications"],
    consultingAppointmentNotifications: json["consultingAppointmentNotifications"],
    lengthMeasureUnit: MeasureUnitModel.fromJson(json["lengthMeasureUnitDto"]),
    weightMeasureUnit: MeasureUnitModel.fromJson(json["weightMeasureUnitDto"]),
    capacityMeasureUnit: MeasureUnitModel.fromJson(json["capacityMeasureUnitDto"]),
    country: CountryResponseModel.fromJson(json["countryDto"]),
    location: Location.fromJson(json["locationDto"]),
    membersLanguage: MembersLanguageModel.fromJson(json["membersLanguageDto"]),
  );

  Map<String, dynamic> toJson() => {
    "darkMode": darkMode,
    "showNotifications": showNotifications,
    "eventNotifications": eventNotifications,
    "waterGoalsNotifications": waterGoalsNotifications,
    "mealGoalsNotifications": mealGoalsNotifications,
    "excerciseGoalsNotifications": excerciseGoalsNotifications,
    "consultingChatNotifications": consultingChatNotifications,
    "consultingAppointmentNotifications": consultingAppointmentNotifications,
    "lengthMeasureUnitDto": lengthMeasureUnit.toJson(),
    "weightMeasureUnitDto": weightMeasureUnit.toJson(),
    "capacityMeasureUnitDto": capacityMeasureUnit.toJson(),
    "countryDto": country.toJson(),
    "locationDto": location.toJson(),
    "membersLanguageDto": membersLanguage.toJson(),
  };
}
