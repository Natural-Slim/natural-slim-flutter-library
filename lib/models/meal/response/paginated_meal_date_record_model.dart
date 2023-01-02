import '../../paging_info/paging_info.dart';
import 'meal_date_record_model.dart';

class PaginatedMealDateRecordModel {
    PaginatedMealDateRecordModel({
        required this.records,
        required this.pagingInfo,
    });

    List<MealDateRecordModel> records;
    PagingInfo pagingInfo;

    factory PaginatedMealDateRecordModel.fromJson(Map<String, dynamic> json) => PaginatedMealDateRecordModel(
        records: List<MealDateRecordModel>.from(json["records"].map((x) => MealDateRecordModel.fromJson(x))),
        pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
    );

    Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "pagingInfo": pagingInfo.toJson(),
    };
}