
import 'package:natural_slim_flutter_library/models/water_tracking/response/water_record.dart';

class WaterDateRecord {
  WaterDateRecord({
    required this.date,
    required this.avg,
    required this.records,
  });

  DateTime date;
  double avg;
  List<WaterRecord> records;

  factory WaterDateRecord.fromJson(Map<String, dynamic> json) => WaterDateRecord(
    date: DateTime.parse(json["date"]),
    avg: json["avg"].toDouble(),
    records: List<WaterRecord>.from(json["records"].map((x) => WaterRecord.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date.toIso8601String(),
    "avg": avg,
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}