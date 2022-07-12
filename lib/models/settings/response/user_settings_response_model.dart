// To parse this JSON data, do
//
//     final userSettingsResponseModel = userSettingsResponseModelFromJson(jsonString);

import 'package:natural_slim_flutter_library/models/countries/response/country_response_model.dart';
import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';
import 'package:natural_slim_flutter_library/models/members_language_model.dart';

class UserSettingsResponseModel {
  UserSettingsResponseModel({
    required this.darkMode,
    required this.countryId,
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
    required this.lengthMeasureUnitDto,
    required this.weightMeasureUnitDto,
    required this.capacityMeasureUnitDto,
    required this.country,
    required this.membersLanguage,
  });

  bool darkMode;
  int countryId;
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
  MeasureUnitModel lengthMeasureUnitDto;
  MeasureUnitModel weightMeasureUnitDto;
  MeasureUnitModel capacityMeasureUnitDto;
  CountryResponseModel country;
  MembersLanguageModel membersLanguage; 

  // static UserSettingsResponseModel userSettingsResponseModelFromJson(String str) => UserSettingsResponseModel.fromJson(json.decode(str));

  // static String userSettingsResponseModelToJson(UserSettingsResponseModel data) => json.encode(data.toJson());

  factory UserSettingsResponseModel.fromJson(Map<String, dynamic> json) => UserSettingsResponseModel(
    darkMode: json["darkMode"],
    countryId: json["countryId"],
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
    lengthMeasureUnitDto: MeasureUnitModel.fromJson(json["lengthMeasureUnitDto"]),
    weightMeasureUnitDto: MeasureUnitModel.fromJson(json["weightMeasureUnitDto"]),
    capacityMeasureUnitDto: MeasureUnitModel.fromJson(json["capacityMeasureUnitDto"]),
    country: CountryResponseModel.fromJson(json["countryDto"]),
    membersLanguage: MembersLanguageModel.fromJson(json["membersLanguageDto"]),
  );

  Map<String, dynamic> toJson() => {
    "darkMode": darkMode,
    "countryId": countryId,
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
    "lengthMeasureUnitDto": lengthMeasureUnitDto.toJson(),
    "weightMeasureUnitDto": weightMeasureUnitDto.toJson(),
    "capacityMeasureUnitDto": capacityMeasureUnitDto.toJson(),
    "countryDto": country.toJson(),
    "membersLanguageDto": membersLanguage.toJson(),
  };
}
