import 'package:natural_slim_flutter_library/models/glucose_tracking/response/glucose_record_model.dart';

class GlucoseDateRecordModel {
  GlucoseDateRecordModel({
    required this.date,
    required this.avg,
    required this.records,
  });

  DateTime date;
  double avg;
  List<GlucoseRecordModel> records;

  factory GlucoseDateRecordModel.fromJson(Map<String, dynamic> json) => GlucoseDateRecordModel(
      date: DateTime.parse(json["date"]),
      avg: json["avg"].toDouble(),
      records: List<GlucoseRecordModel>.from(json["records"].map((x) => GlucoseRecordModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "date": date.toIso8601String(),
      "avg": avg,
      "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}