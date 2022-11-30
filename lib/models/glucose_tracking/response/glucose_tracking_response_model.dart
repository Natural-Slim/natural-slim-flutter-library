import 'dart:convert';

import 'package:natural_slim_flutter_library/models/glucose_tracking/response/glucose_standard_level_model.dart';
import 'package:natural_slim_flutter_library/models/glucose_tracking/response/paginated_glucose_date_record_model.dart';
import 'package:natural_slim_flutter_library/models/paging_info/paging_info.dart';

import '../../measure_unit_model.dart';

class GlucoseTrackingResponseModel {
    GlucoseTrackingResponseModel({
        required this.start,
        required this.end,
        required this.count,
        this.glucoseStandardLevelDto,
        required this.measureUnitDto,
        required this.paginatedRecords,
    });

    DateTime start;
    DateTime end;
    int count;
    MeasureUnitModel measureUnitDto;
    List<GlucoseStandardLevel>? glucoseStandardLevelDto;
    PaginatedGlucoseDateRecordModel paginatedRecords;

    static GlucoseTrackingResponseModel empty(){
      return GlucoseTrackingResponseModel(
        start: DateTime.now(), 
        end: DateTime.now(), 
        count: 0, 
        measureUnitDto: MeasureUnitModel(
          id: 0, 
          unit: '', 
          abbreviation: ''
        ), 
        paginatedRecords: PaginatedGlucoseDateRecordModel(
          records: [], 
          pagingInfo: PagingInfo(
            perPage: 0, 
            currentPage: 0, 
            totalRecords: 0, 
            totalPages: 0
          )
        )
      );
    }

    static GlucoseTrackingResponseModel glucoseTrackingResponseModelFromJson(String str) => GlucoseTrackingResponseModel.fromJson(json.decode(str));

    static String glucoseTrackingResponseModelToJson(GlucoseTrackingResponseModel data) => json.encode(data.toJson());

    factory GlucoseTrackingResponseModel.fromJson(Map<String, dynamic> json) => GlucoseTrackingResponseModel(
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        count: json["count"],
        measureUnitDto: MeasureUnitModel.fromJson(json["measureUnitDto"]),
        glucoseStandardLevelDto: List<GlucoseStandardLevel>.from(json["glucoseStandardLevelDto"].map((x) => GlucoseStandardLevel.fromJson(x))),
        paginatedRecords: PaginatedGlucoseDateRecordModel.fromJson(json["paginatedRecords"]),
    );

    Map<String, dynamic> toJson() => {
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
        "count": count,
        "measureUnitDto": measureUnitDto.toJson(),
        "glucoseStandardLevelDto": glucoseStandardLevelDto != null ? List<GlucoseStandardLevel>.from(glucoseStandardLevelDto!.map((x) => x.toJson())) : [],
        "paginatedRecords": paginatedRecords.toJson(),
    };
}
