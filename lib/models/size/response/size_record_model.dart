class SizeRecordModel {
    SizeRecordModel({
        required this.chest,
        required this.leftArm,
        required this.rightArm,
        required this.abdomen,
        required this.waist,
        required this.hips,
        required this.leftThigh,
        required this.rightThigh,
        this.comment,
        required this.hour,
    });

    double chest;
    double leftArm;
    double rightArm;
    double abdomen;
    double waist;
    double hips;
    double leftThigh;
    double rightThigh;
    String? comment;
    DateTime hour;

    factory SizeRecordModel.fromJson(Map<String, dynamic> json) => SizeRecordModel(
        chest: json["chest"].toDouble(),
        leftArm: json["leftArm"].toDouble(),
        rightArm: json["rightArm"].toDouble(),
        abdomen: json["abdomen"].toDouble(),
        waist: json["waist"].toDouble(),
        hips: json["hips"].toDouble(),
        leftThigh: json["leftThigh"].toDouble(),
        rightThigh: json["rightThigh"].toDouble(),
        comment: json["comment"],
        hour: DateTime.parse(json["hour"]),
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
        "hour": hour.toIso8601String(),
    };
}