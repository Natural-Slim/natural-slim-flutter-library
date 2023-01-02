import '../../../paging_info/paging_info.dart';
import 'meal_ingredient_record_model.dart';

class PaginatedMealIngredientDateRecordsModel {
  PaginatedMealIngredientDateRecordsModel({
      this.records,
      required this.pagingInfo,
  });

  List<MealIngredientRecordModel>? records;
  PagingInfo pagingInfo;

  factory PaginatedMealIngredientDateRecordsModel.fromJson(Map<String, dynamic> json) => PaginatedMealIngredientDateRecordsModel(
      records: List<MealIngredientRecordModel>.from(json["records"].map((x) => MealIngredientRecordModel.fromJson(x))),
      pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
  );

  Map<String, dynamic> toJson() => {
    "records": records != null ? List<dynamic>.from(records!.map((x) => x.toJson())) : null,
    "pagingInfo": pagingInfo.toJson(),
  };
}