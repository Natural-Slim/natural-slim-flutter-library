
import 'package:natural_slim_flutter_library/models/water_tracking/response/water_date_record.dart';

import '../../paging_info/paging_info.dart';

class PaginatedWaterDateRecord {
  PaginatedWaterDateRecord({
    required this.records,
    required this.pagingInfo,
  });

  List<WaterDateRecord> records;
  PagingInfo pagingInfo;

  factory PaginatedWaterDateRecord.fromJson(Map<String, dynamic> json) => PaginatedWaterDateRecord(
    records: List<WaterDateRecord>.from(json["records"].map((x) => WaterDateRecord.fromJson(x))),
    pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "records": List<dynamic>.from(records.map((x) => x.toJson())),
    "pagingInfo": pagingInfo.toJson(),
  };
}