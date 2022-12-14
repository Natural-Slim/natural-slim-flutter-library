import 'package:natural_slim_flutter_library/models/measure_unit_model.dart';
import 'package:natural_slim_flutter_library/models/size/response/paginated_size_record.dart';

class SizeTrackingResponseModel {
    SizeTrackingResponseModel({
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
    SizePaginatedRecords paginatedRecords;

    factory SizeTrackingResponseModel.fromJson(Map<String, dynamic> json) => SizeTrackingResponseModel(
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        count: json["count"],
        measureUnitDto: MeasureUnitModel.fromJson(json["measureUnitDto"]),
        paginatedRecords: SizePaginatedRecords.fromJson(json["paginatedRecords"]),
    );

    Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "count": count,
        "measureUnitDto": measureUnitDto.toJson(),
        "paginatedRecords": paginatedRecords.toJson(),
    };
}