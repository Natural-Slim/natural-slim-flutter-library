class MembersLanguageModel {
  MembersLanguageModel({
    required this.id,
    required this.code,
    required this.name,
  });

  int id;
  String code;
  String name;

  factory MembersLanguageModel.fromJson(Map<String, dynamic> json) => MembersLanguageModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
  };
}