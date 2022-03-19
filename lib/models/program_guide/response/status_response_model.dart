// To parse this JSON data, do
//
//     final statusResponse = statusResponseFromJson(jsonString);

import 'dart:convert';

StatusResponse statusResponseFromJson(String str) => StatusResponse.fromJson(json.decode(str));

String statusResponseToJson(StatusResponse data) => json.encode(data.toJson());

class StatusResponse {
    StatusResponse({
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

    factory StatusResponse.fromJson(Map<String, dynamic> json) => StatusResponse(
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
