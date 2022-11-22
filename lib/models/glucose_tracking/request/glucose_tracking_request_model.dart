import 'dart:convert';

class GlucoseTrackingRequestModel {
    GlucoseTrackingRequestModel({
        required this.glucoseLevel,
        required this.registered,
        this.comment,
    });

    double glucoseLevel;
    DateTime registered;
    String? comment;

    static GlucoseTrackingRequestModel glucoseTrackingRequestModelFromJson(String str) => GlucoseTrackingRequestModel.fromJson(json.decode(str));

    static String glucoseTrackingRequestModelToJson(GlucoseTrackingRequestModel data) => json.encode(data.toJson());

    factory GlucoseTrackingRequestModel.fromJson(Map<String, dynamic> json) => GlucoseTrackingRequestModel(
        glucoseLevel: json["glucoseLevel"],
        registered: DateTime.parse(json["registered"]),
        comment: json["comment"],
    );

    Map<String, dynamic> toJson() => {
        "glucoseLevel": glucoseLevel.toDouble(),
        "registered": registered.toIso8601String(),
        "comment": comment,
    };
}
