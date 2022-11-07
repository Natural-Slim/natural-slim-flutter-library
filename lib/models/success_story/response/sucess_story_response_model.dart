class SuccessStoryResponseModel {
  SuccessStoryResponseModel({
    required this.id,
    required this.story,
    this.userProgramStepId,
    this.programStepId,
    this.photos,
    required this.registered
  });

  int id;
  String story;
  int? userProgramStepId;
  int? programStepId;
  List<String>? photos;
  DateTime registered;

  static SuccessStoryResponseModel empty(){
    return SuccessStoryResponseModel(
      id: 0, 
      story: '', 
      registered: DateTime.now()
    );
  }

  factory SuccessStoryResponseModel.fromJson(Map<String, dynamic> json) => SuccessStoryResponseModel(
    id: json["id"],
    story: json["story"],
    userProgramStepId: json["userProgramStepId"],
    programStepId: json["programStepId"],
    photos: json["photos"] != null ? List<String>.from(json["photos"].map((x) => x)) : null,
    registered: DateTime.parse(json["registered"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "story": story,
    "userProgramStepId": userProgramStepId,
    "programStepId": programStepId,
    "photos": photos != null ? List<dynamic>.from(photos!.map((x) => x)) : null,
    "registered": registered.toIso8601String(),
  };
}
