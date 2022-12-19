import 'dart:convert';

import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';

class RecordedSizeTrackingResponseModel {
    RecordedSizeTrackingResponseModel({
        required this.chest,
        required this.leftArm,
        required this.rightArm,
        required this.abdomen,
        required this.waist,
        required this.hips,
        required this.leftThigh,
        required this.rightThigh,
        required this.registered,
        required this.userId,
        required this.measureUnit,
        this.comment,
    });

    double chest;
    double leftArm;
    double rightArm;
    double abdomen;
    double waist;
    double hips;
    double leftThigh;
    double rightThigh;
    DateTime registered;
    String? comment;
    String userId;
    MeasureUnitModel measureUnit;

    static RecordedSizeTrackingResponseModel recordedSizeTrackingResponseModelFromJson(String str) => RecordedSizeTrackingResponseModel.fromJson(json.decode(str));

    static String recordedSizeTrackingResponseModelToJson(RecordedSizeTrackingResponseModel data) => json.encode(data.toJson());

    factory RecordedSizeTrackingResponseModel.fromJson(Map<String, dynamic> json) => RecordedSizeTrackingResponseModel(
        chest: json["chest"].toDouble(),
        leftArm: json["leftArm"].toDouble(),
        rightArm: json["rightArm"].toDouble(),
        abdomen: json["abdomen"].toDouble(),
        waist: json["waist"].toDouble(),
        hips: json["hips"].toDouble(),
        leftThigh: json["leftThigh"].toDouble(),
        rightThigh: json["rightThigh"].toDouble(),
        registered: DateTime.parse(json["registered"]),
        comment: json["comment"],
        userId: json["userId"],
        measureUnit: MeasureUnitModel.fromJson(json["measureUnit"]),
    );

    Map<String, dynamic> toJson() => {
        "chest": chest,
        "leftArm": leftArm,
        "rightArm": rightArm,
        "abdomen": abdomen,
        "waist": waist,
        "hips": hips,
        "leftThigh": leftThigh,
        "rightThigh": rightThigh,
        "registered": registered.toIso8601String(),
        "comment": comment,
        "userId": userId,
        "measureUnit": measureUnit.toJson(),
    };
}