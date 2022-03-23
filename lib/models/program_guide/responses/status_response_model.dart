// To parse this JSON data, do
//
//     final statusResponse = statusResponseFromJson(jsonString);

import 'dart:convert';

StatusResponseModel statusResponseFromJson(String str) => StatusResponseModel.fromJson(json.decode(str));

String statusResponseToJson(StatusResponseModel data) => json.encode(data.toJson());

class StatusResponseModel {
    StatusResponseModel({
      required this.totalSteps,
      required this.currentStepId,
      required this.completedSteps,
      required this.remainingSteps,
      required this.programStart,
      required this.programEnd,
    });

    int totalSteps;
    int currentStepId;
    int completedSteps;
    int remainingSteps;
    DateTime programStart;
    DateTime programEnd;

    factory StatusResponseModel.fromJson(Map<String, dynamic> json) => StatusResponseModel(
        totalSteps: json["totalSteps"],
        currentStepId: json["currentStepId"],
        completedSteps: json["completedSteps"],
        remainingSteps: json["remainingSteps"],
        programStart: DateTime.parse(json["programStart"]),
        programEnd: DateTime.parse(json["programEnd"]),
    );

    Map<String, dynamic> toJson() => {
        "totalSteps": totalSteps,
        "currentStepId": currentStepId,
        "completedSteps": completedSteps,
        "remainingSteps": remainingSteps,
        "programStart": programStart.toIso8601String(),
        "programEnd": programEnd.toIso8601String(),
    };
}
