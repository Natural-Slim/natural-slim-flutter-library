class MeasureUnitType {
  MeasureUnitType({
    required this.id,
    required this.type,
  });

  int id;
  String type;

  factory MeasureUnitType.fromJson(Map<String, dynamic> json) => MeasureUnitType(
    id: json["id"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
  };
}
