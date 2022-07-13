// To parse this JSON data, do
//
//     final dataAppSettingsResponseModel = dataAppSettingsResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:natural_slim_flutter_library/models/countries/response/country_response_model.dart';
import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';
import 'package:natural_slim_flutter_library/models/members_language_model.dart';



class DataAppSettingsResponseModel {
  DataAppSettingsResponseModel({
    required this.countries,
    required this.languages,
    required this.lengthMeasureUnit,
    required this.weightMeasureUnit,
    required this.capacityMeasureUnit,
  });

  List<CountryResponseModel> countries;
  List<MembersLanguageModel> languages;
  List<MeasureUnitModel> lengthMeasureUnit;
  List<MeasureUnitModel> weightMeasureUnit;
  List<MeasureUnitModel> capacityMeasureUnit;

  static DataAppSettingsResponseModel dataAppSettingsResponseModelFromJson(String str) => DataAppSettingsResponseModel.fromJson(json.decode(str));

  static String dataAppSettingsResponseModelToJson(DataAppSettingsResponseModel data) => json.encode(data.toJson());

  factory DataAppSettingsResponseModel.fromJson(Map<String, dynamic> json) => DataAppSettingsResponseModel(
    countries: List<CountryResponseModel>.from(json["countries"].map((x) => CountryResponseModel.fromJson(x))),
    languages: List<MembersLanguageModel>.from(json["languages"].map((x) => MembersLanguageModel.fromJson(x))),
    lengthMeasureUnit: List<MeasureUnitModel>.from(json["lengthMeasureUnit"].map((x) => MeasureUnitModel.fromJson(x))),
    weightMeasureUnit: List<MeasureUnitModel>.from(json["weightMeasureUnit"].map((x) => MeasureUnitModel.fromJson(x))),
    capacityMeasureUnit: List<MeasureUnitModel>.from(json["capacityMeasureUnit"].map((x) => MeasureUnitModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "lengthMeasureUnit": List<dynamic>.from(lengthMeasureUnit.map((x) => x.toJson())),
    "weightMeasureUnit": List<dynamic>.from(weightMeasureUnit.map((x) => x.toJson())),
    "capacityMeasureUnit": List<dynamic>.from(capacityMeasureUnit.map((x) => x.toJson())),
  };
}