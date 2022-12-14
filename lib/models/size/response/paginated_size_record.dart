import 'package:natural_slim_flutter_library/models/size/response/size_record_model.dart';

import '../../paging_info/paging_info.dart';

class SizePaginatedRecords {
    SizePaginatedRecords({
        required this.records,
        required this.pagingInfo,
    });

    List<SizeRecordModel> records;
    PagingInfo pagingInfo;

    factory SizePaginatedRecords.fromJson(Map<String, dynamic> json) => SizePaginatedRecords(
        records: List<SizeRecordModel>.from(json["records"].map((x) => SizeRecordModel.fromJson(x))),
        pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "records": List<SizeRecordModel>.from(records.map((x) => x.toJson())),
        "pagingInfo": pagingInfo.toJson(),
    };
}