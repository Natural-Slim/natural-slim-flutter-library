
class ProgramStepModel {
  ProgramStepModel({
    required this.id,
    required this.stepName,
    required this.stepDescription,
    required this.jsonTemplate,
  });

  int id;
  String stepName;
  String stepDescription;
  String jsonTemplate;

  factory ProgramStepModel.fromJson(Map<String, dynamic> json) => ProgramStepModel(
    id: json["id"],
    stepName: json["stepName"],
    stepDescription: json["stepDescription"],
    jsonTemplate: json["jsonTemplate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stepName": stepName,
    "stepDescription": stepDescription,
    "jsonTemplate": jsonTemplate,
  };
}