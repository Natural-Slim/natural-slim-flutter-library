import 'dart:convert';

import 'package:natural_slim_flutter_library/models/countries/response/country_response_model.dart';
import 'package:natural_slim_flutter_library/models/measure_data_model.dart';
import 'package:natural_slim_flutter_library/models/members_language_model.dart';



class SettingsCatalogResponseModel {
  SettingsCatalogResponseModel({
    required this.countries,
    required this.languages,
    required this.lengthMeasureData,
    required this.weightMeasureData,
    required this.capacityMeasureData,
  });

  List<CountryResponseModel> countries;
  List<MembersLanguageModel> languages;
  MeasureDataModel lengthMeasureData;
  MeasureDataModel weightMeasureData;
  MeasureDataModel capacityMeasureData;

  static SettingsCatalogResponseModel dataAppSettingsResponseModelFromJson(String str) => SettingsCatalogResponseModel.fromJson(json.decode(str));

  static String dataAppSettingsResponseModelToJson(SettingsCatalogResponseModel data) => json.encode(data.toJson());

  factory SettingsCatalogResponseModel.fromJson(Map<String, dynamic> json) => SettingsCatalogResponseModel(
    countries: List<CountryResponseModel>.from(json["countries"].map((x) => CountryResponseModel.fromJson(x))),
    languages: List<MembersLanguageModel>.from(json["languages"].map((x) => MembersLanguageModel.fromJson(x))),
    lengthMeasureData: MeasureDataModel.fromJson(json["lengthMeasureUnit"]),
    weightMeasureData: MeasureDataModel.fromJson(json["weightMeasureUnit"]),
    capacityMeasureData: MeasureDataModel.fromJson(json["capacityMeasureUnit"]),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
    "lengthMeasureUnit": lengthMeasureData.toJson(),
    "weightMeasureUnit": weightMeasureData.toJson(),
    "capacityMeasureUnit": capacityMeasureData.toJson(),
  };
}