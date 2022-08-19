
import 'dart:convert';

class SuccesStoryRequestModel {
  SuccesStoryRequestModel({
      required this.story,
      this.programStepId,
      this.photos,
  });

  String story;
  int? programStepId;
  List<String>? photos;

  SuccesStoryRequestModel succesStoryRequestModelFromJson(String str) => SuccesStoryRequestModel.fromJson(json.decode(str));

  String succesStoryRequestModelToJson(SuccesStoryRequestModel data) => json.encode(data.toJson());

  factory SuccesStoryRequestModel.fromJson(Map<String, dynamic> json) => SuccesStoryRequestModel(
      story: json["story"],
      programStepId: json["programStepId"],
      photos: json["photos"] != null ? List<String>.from(json["photos"].map((x) => x)) : null,
  );

  Map<String, dynamic> toJson() => {
      "story": story,
      "programStepId": programStepId,
      "photos": photos != null ? List<dynamic>.from(photos!.map((x) => x)) : null,
  };
}

