import 'package:natural_slim_flutter_library/models/paging_info/paging_info.dart';
import 'package:natural_slim_flutter_library/models/water_tracking/response/paginated_water_record.dart';

import '../../measure_unit_model.dart';
class WaterRecordResponseModel {
  WaterRecordResponseModel({
    required this.start,
    required this.end,
    required this.count,
    required this.measureUnitModel,
    required this.paginatedRecords,
  });

  DateTime start;
  DateTime end;
  int count;
  MeasureUnitModel measureUnitModel;
  PaginatedWaterDateRecord paginatedRecords;

  static WaterRecordResponseModel empty(){
    return WaterRecordResponseModel(
      start: DateTime.now(), 
      end: DateTime.now(), 
      count: 0, 
      measureUnitModel: MeasureUnitModel(
        id: 0, 
        unit: '', 
        abbreviation: ''
      ), 
      paginatedRecords: PaginatedWaterDateRecord(
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

  factory WaterRecordResponseModel.fromJson(Map<String, dynamic> json) => WaterRecordResponseModel(
    start: DateTime.parse(json["start"]),
    end: DateTime.parse(json["end"]),
    count: json["count"],
    measureUnitModel: MeasureUnitModel.fromJson(json["measureUnitDto"]),
    paginatedRecords: PaginatedWaterDateRecord.fromJson(json["paginatedRecords"]),
  );

  Map<String, dynamic> toJson() => {
    "start": start,
    "end": end,
    "count": count,
    "measureUnitDto": measureUnitModel.toJson(),
    "paginatedRecords": paginatedRecords.toJson(),
  };
}
