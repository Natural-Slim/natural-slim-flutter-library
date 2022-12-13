import 'dart:convert';

class SizeTrackingRequestModel {
    SizeTrackingRequestModel({
        required this.chest,
        required this.leftArm,
        required this.rightArm,
        required this.abdomen,
        required this.waist,
        required this.hips,
        required this.leftThigh,
        required this.rightThigh,
        required this.measureUnitId,
        required this.registered,
        this.comment,
    });

    int chest;
    int leftArm;
    int rightArm;
    int abdomen;
    int waist;
    int hips;
    int leftThigh;
    int rightThigh;
    String? comment;
    int measureUnitId;
    DateTime registered;

    static SizeTrackingRequestModel sizeTrackingRequestModelFromJson(String str) => SizeTrackingRequestModel.fromJson(json.decode(str));

    static String sizeTrackingRequestModelToJson(SizeTrackingRequestModel data) => json.encode(data.toJson());

    factory SizeTrackingRequestModel.fromJson(Map<String, dynamic> json) => SizeTrackingRequestModel(
        chest: json["chest"],
        leftArm: json["leftArm"],
        rightArm: json["rightArm"],
        abdomen: json["abdomen"],
        waist: json["waist"],
        hips: json["hips"],
        leftThigh: json["leftThigh"],
        rightThigh: json["rightThigh"],
        comment: json["comment"],
        measureUnitId: json["measureUnitId"],
        registered: DateTime.parse(json["registered"]),
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
        "comment": comment,
        "measureUnitId": measureUnitId,
        "registered": registered.toIso8601String(),
    };
}
