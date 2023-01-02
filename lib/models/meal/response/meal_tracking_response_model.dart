import 'dart:convert';

import 'package:natural_slim_flutter_library/models/meal/response/paginated_meal_date_record_model.dart';
import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';

class MealTrackingResponseModel {
    MealTrackingResponseModel({
        required this.start,
        required this.end,
        required this.count,
        required this.measureUnitDto,
        required this.paginatedRecords,
    });

    DateTime start;
    DateTime end;
    int count;
    MeasureUnitModel measureUnitDto;
    PaginatedMealDateRecordModel paginatedRecords;

    static MealTrackingResponseModel mealTrackingResponseModelFromJson(String str) => MealTrackingResponseModel.fromJson(json.decode(str));

    static String mealTrackingResponseModelToJson(MealTrackingResponseModel data) => json.encode(data.toJson());

    factory MealTrackingResponseModel.fromJson(Map<String, dynamic> json) => MealTrackingResponseModel(
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        count: json["count"],
        measureUnitDto: MeasureUnitModel.fromJson(json["measureUnitDto"]),
        paginatedRecords: PaginatedMealDateRecordModel.fromJson(json["paginatedRecords"]),
    );

    Map<String, dynamic> toJson() => {
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "count": count,
        "measureUnitDto": measureUnitDto.toJson(),
        "paginatedRecords": paginatedRecords.toJson(),
    };
}
