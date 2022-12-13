class GlucoseStandardLevel {
    GlucoseStandardLevel({
        required this.id,
        required this.levelMin,
        required this.levelMax,
        this.name,
    });

    int id;
    String? name;
    double levelMin;
    double levelMax;

    factory GlucoseStandardLevel.fromJson(Map<String, dynamic> json) => GlucoseStandardLevel(
        id: json["id"],
        name: json["name"],
        levelMin: json["levelMin"].toDouble(),
        levelMax: json["levelMax"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "levelMin": levelMin,
        "levelMax": levelMax,
    };
}