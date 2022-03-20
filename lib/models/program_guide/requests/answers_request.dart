// To parse this JSON data, do
//
//     final answerRequest = answerRequestFromJson(jsonString);
import 'dart:convert';

AnswerRequest answerRequestFromJson(String str) => AnswerRequest.fromJson(json.decode(str));

String answerRequestToJson(AnswerRequest data) => json.encode(data.toJson());

class AnswerRequest {
  AnswerRequest({
    required this.stepId,
    required this.answers,
  });

  int stepId;
  Map<String, String> answers;

  factory AnswerRequest.fromJson(Map<String, dynamic> json) => AnswerRequest(
    stepId: json["stepId"],
    answers:  Map<String, String>.from(json['widget_data'] as Map),
  );

  Map<String, dynamic> toJson() => {
    "stepId": stepId,
    "answers": answers,
  };
}
