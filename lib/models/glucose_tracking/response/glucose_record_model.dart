class GlucoseRecordModel {
  GlucoseRecordModel({
      this.comments,
      required this.glucoseLevel,
      required this.hour,
  });

  double glucoseLevel;
  String? comments;
  DateTime hour;

  factory GlucoseRecordModel.fromJson(Map<String, dynamic> json) => GlucoseRecordModel(
      glucoseLevel: json["glucoseLevel"].toDouble(),
      comments: json["comments"],
      hour: DateTime.parse(json["hour"]),
  );

  Map<String, dynamic> toJson() => {
      "glucoseLevel": glucoseLevel,
      "comments": comments,
      "hour": hour.toIso8601String(),
  };
}