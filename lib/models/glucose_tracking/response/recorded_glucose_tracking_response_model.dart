import 'dart:convert';

import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';

import 'glucose_standard_level_model.dart';

class RecordedGlucoseTrackingResponseModel {
    RecordedGlucoseTrackingResponseModel({
        required this.id,
        required this.glucoseLevel,
        required this.registered,
        required this.measureUnit,
        required this.glucoseStandardLevel,
        this.comment,
    });

    int id;
    double glucoseLevel;
    DateTime registered;
    String? comment;
    MeasureUnitModel measureUnit;
    GlucoseStandardLevel glucoseStandardLevel;

    static RecordedGlucoseTrackingResponseModel recordedGlucoseTrackingResponseModelFromJson(String str) => RecordedGlucoseTrackingResponseModel.fromJson(json.decode(str));

    static String recordedGlucoseTrackingResponseModelToJson(RecordedGlucoseTrackingResponseModel data) => json.encode(data.toJson());

    factory RecordedGlucoseTrackingResponseModel.fromJson(Map<String, dynamic> json) => RecordedGlucoseTrackingResponseModel(
        id: json["id"],
        glucoseLevel: json["glucoseLevel"].toDouble(),
        registered: DateTime.parse(json["registered"]),
        comment: json["comment"],
        measureUnit: MeasureUnitModel.fromJson(json["measureUnit"]),
        glucoseStandardLevel: GlucoseStandardLevel.fromJson(json["glucoseStandardLevel"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "glucoseLevel": glucoseLevel,
        "registered": registered.toIso8601String(),
        "comment": comment,
        "measureUnit": measureUnit.toJson(),
        "glucoseStandardLevel": glucoseStandardLevel.toJson(),
    };
}