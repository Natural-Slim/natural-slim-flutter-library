import 'meal_record_model.dart';

class MealDateRecordModel {
    MealDateRecordModel({
        required this.date,
        required this.avg,
        this.records,
    });

    DateTime date;
    double avg;
    List<MealRecordModel>? records;

    factory MealDateRecordModel.fromJson(Map<String, dynamic> json) => MealDateRecordModel(
        date: DateTime.parse(json["date"]),
        avg: double.parse(json["avg"]),
        records: List<MealRecordModel>.from(json["records"].map((x) => MealRecordModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "avg": avg.toDouble(),
        "records": records != null ? List<dynamic>.from(records!.map((x) => x.toJson())) : null,
    };
}