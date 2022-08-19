import 'dart:convert';

class SuccesStoryResponseModel {
  SuccesStoryResponseModel({
      this.story,
      this.userProgramStepId,
      this.programStepId,
      this.photos,
  });

  String? story;
  int? userProgramStepId;
  int? programStepId;
  List<String>? photos;

  SuccesStoryResponseModel succesStoryResponseModelFromJson(String str) => SuccesStoryResponseModel.fromJson(json.decode(str));

  String succesStoryResponseModelToJson(SuccesStoryResponseModel data) => json.encode(data.toJson());

  factory SuccesStoryResponseModel.fromJson(Map<String, dynamic> json) => SuccesStoryResponseModel(
      story: json["story"],
      userProgramStepId: json["userProgramStepId"],
      programStepId: json["programStepId"],
      photos: List<String>.from(json["photos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
      "story": story,
      "userProgramStepId": userProgramStepId,
      "programStepId": programStepId,
      "photos": List<dynamic>.from(photos!.map((x) => x)),
  };
}
