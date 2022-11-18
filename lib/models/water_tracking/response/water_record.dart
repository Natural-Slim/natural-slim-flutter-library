class WaterRecord {
  WaterRecord({
    required this.amount,
    this.comments,
    required this.hour,
  });

  double amount;
  String? comments;
  String hour;

  factory WaterRecord.fromJson(Map<String, dynamic> json) => WaterRecord(
    amount: json["amount"].toDouble(),
    comments: json["comments"],
    hour: json["hour"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "comments": comments,
    "hour": hour,
  };
}