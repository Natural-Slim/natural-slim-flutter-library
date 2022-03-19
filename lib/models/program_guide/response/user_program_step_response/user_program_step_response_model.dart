// To parse this JSON data, do
//
//     final UserProgramStepResponse = UserProgramStepResponseFromJson(jsonString);

import 'dart:convert';

import 'program_step_model.dart';

UserProgramStepResponse welcomeFromJson(String str) => UserProgramStepResponse.fromJson(json.decode(str));

String welcomeToJson(UserProgramStepResponse data) => json.encode(data.toJson());

class UserProgramStepResponse {
  UserProgramStepResponse({
    required this.id,
    required this.programStep,
  });

  int id;
  ProgramStep programStep;

  factory UserProgramStepResponse.fromJson(Map<String, dynamic> json) => UserProgramStepResponse(
    id: json["id"],
    programStep: ProgramStep.fromJson(json["programStep"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "programStep": programStep.toJson(),
  };
}