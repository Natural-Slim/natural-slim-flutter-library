import 'dart:convert';

import '../../paging_info/paging_info.dart';
import 'sucess_story_response_model.dart';

class SuccessStoryRecordsResponseModel {
  
  SuccessStoryRecordsResponseModel({
      required this.records,
      required this.pagingInfo,
  });

  List<SuccessStoryResponseModel> records;
  PagingInfo pagingInfo;

  SuccessStoryRecordsResponseModel allSuccessStoryResponseModelFromJson(String str) => SuccessStoryRecordsResponseModel.fromJson(json.decode(str));

  String allSuccessStoryResponseModelToJson(SuccessStoryRecordsResponseModel data) => json.encode(data.toJson());
  
  factory SuccessStoryRecordsResponseModel.fromJson(Map<String, dynamic> json) => SuccessStoryRecordsResponseModel(
      records: List<SuccessStoryResponseModel>.from(json["records"].map((x) => SuccessStoryResponseModel.fromJson(x))),
      pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
  );

  Map<String, dynamic> toJson() => {
      "records": List<dynamic>.from(records.map((x) => x.toJson())),
      "pagingInfo": pagingInfo.toJson(),
  };
}
