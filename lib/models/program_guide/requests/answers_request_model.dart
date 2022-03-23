// To parse this JSON data, do
//
//     final answerRequest = answerRequestFromJson(jsonString);
import 'dart:convert';

AnswerRequestModel answerRequestFromJson(String str) => AnswerRequestModel.fromJson(json.decode(str));

String answerRequestToJson(AnswerRequestModel data) => json.encode(data.toJson());

class AnswerRequestModel {
  AnswerRequestModel({
    required this.stepId,
    required this.answers,
  });

  int stepId;
  Map<String, String> answers;

  factory AnswerRequestModel.fromJson(Map<String, dynamic> json) => AnswerRequestModel(
    stepId: json["stepId"],
    answers:  Map<String, String>.from(json['widget_data'] as Map),
  );

  Map<String, dynamic> toJson() => {
    "stepId": stepId,
    "answers": answers,
  };
}
