import 'dosage_model.dart';

class UserProductRequestModel {
  UserProductRequestModel({
    required this.inUse,
    required this.productId,
    this.comments,
    required this.userProductDosages,
  });

  bool inUse;
  int productId;
  String? comments;
  List<DosageModel> userProductDosages;

  factory UserProductRequestModel.fromJson(Map<String, dynamic> json) => UserProductRequestModel(
    inUse: json["inUse"],
    productId: json["productId"],
    comments: json["comments"],
    userProductDosages: List<DosageModel>.from(json["userProductDosages"].map((x) => DosageModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "inUse": inUse,
    "productId": productId,
    "comments": comments,
    "userProductDosages": List<dynamic>.from(userProductDosages.map((x) => x.toJson())),
  };
}
