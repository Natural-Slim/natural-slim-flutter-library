import '../../paging_info/paging_info.dart';
import 'glucose_date_record_model.dart';

class PaginatedGlucoseDateRecordModel {
    PaginatedGlucoseDateRecordModel({
        required this.records,
        required this.pagingInfo,
    });

    List<GlucoseDateRecordModel> records;
    PagingInfo pagingInfo;

    factory PaginatedGlucoseDateRecordModel.fromJson(Map<String, dynamic> json) => PaginatedGlucoseDateRecordModel(
        records: List<GlucoseDateRecordModel>.from(json["records"].map((x) => GlucoseDateRecordModel.fromJson(x))),
        pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "pagingInfo": pagingInfo.toJson(),
    };
}