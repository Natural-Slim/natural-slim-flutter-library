// To parse this JSON data, do
//
//     final UserProgramStepResponse = UserProgramStepResponseFromJson(jsonString);

import 'dart:convert';

import 'program_step_model.dart';

UserProgramStepResponseModel welcomeFromJson(String str) => UserProgramStepResponseModel.fromJson(json.decode(str));

String welcomeToJson(UserProgramStepResponseModel data) => json.encode(data.toJson());

class UserProgramStepResponseModel {
  UserProgramStepResponseModel({
    required this.id,
    required this.programStep,
  });

  int id;
  ProgramStepModel programStep;

  factory UserProgramStepResponseModel.fromJson(Map<String, dynamic> json) => UserProgramStepResponseModel(
    id: json["id"],
    programStep: ProgramStepModel.fromJson(json["programStep"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "programStep": programStep.toJson(),
  };
}