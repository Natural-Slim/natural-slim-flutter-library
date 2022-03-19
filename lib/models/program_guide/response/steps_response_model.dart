// To parse this JSON data, do
//
//     final programStepsResponse = programStepsResponseFromJson(jsonString);

import 'dart:convert';

ProgramStepsResponse programStepsResponseFromJson(String str) => ProgramStepsResponse.fromJson(json.decode(str));

String programStepsResponseToJson(ProgramStepsResponse data) => json.encode(data.toJson());

class ProgramStepsResponse {
    ProgramStepsResponse({
      required this.records,
      required this.pagingInfo,
    });

    List<ProgramStep> records;
    PagingInfo pagingInfo;

    factory ProgramStepsResponse.fromJson(Map<String, dynamic> json) => ProgramStepsResponse(
      records: List<ProgramStep>.from(json["records"].map((x) => ProgramStep.fromJson(x))),
      pagingInfo: PagingInfo.fromJson(json["pagingInfo"]),
    );

    Map<String, dynamic> toJson() => {
      "records": List<dynamic>.from(records.map((x) => x.toJson())),
      "pagingInfo": pagingInfo.toJson(),
    };
}

class PagingInfo {
    PagingInfo({
      required this.perPage,
      required this.currentPage,
      required this.totalRecords,
      required this.totalPages,
    });

    int perPage;
    int currentPage;
    int totalRecords;
    int totalPages;

    factory PagingInfo.fromJson(Map<String, dynamic> json) => PagingInfo(
      perPage: json["perPage"],
      currentPage: json["currentPage"],
      totalRecords: json["totalRecords"],
      totalPages: json["totalPages"],
    );

    Map<String, dynamic> toJson() => {
      "perPage": perPage,
      "currentPage": currentPage,
      "totalRecords": totalRecords,
      "totalPages": totalPages,
    };
}

class ProgramStep {
    ProgramStep({
      required this.id,
      required this.stepName,
      required this.stepDescription,
      // required this.url,
      required this.isCompleted,
    });

    int id;
    String stepName;
    String stepDescription;
    // String url;
    bool isCompleted;

    factory ProgramStep.fromJson(Map<String, dynamic> json) => ProgramStep(
      id: json["id"],
      stepName: json["stepName"],
      stepDescription: json["stepDescription"],
      // url: json["url"],
      isCompleted: json["isCompleted"],
    );

    Map<String, dynamic> toJson() => {
      "id": id,
      "stepName": stepName,
      "stepDescription": stepDescription,
      // "url": url,
      "isCompleted": isCompleted,
    };
}
