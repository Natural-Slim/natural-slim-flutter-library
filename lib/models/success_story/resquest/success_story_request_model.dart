
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
      photos: List<String>.from(json["photos"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
      "story": story,
      "programStepId": programStepId,
      "photos": List<dynamic>.from(photos!.map((x) => x)),
  };
}

