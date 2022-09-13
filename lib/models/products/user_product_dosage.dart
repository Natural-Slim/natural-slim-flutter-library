class UserProductDosage {
  UserProductDosage({
    required this.value,
    required this.dosage,
    required this.userProductId,
  });

  String value;
  Dosage? dosage;
  int userProductId;

  factory UserProductDosage.fromJson(Map<String, dynamic> json) => UserProductDosage(
    value: json["value"],
    dosage: DosageExtension.getValue(json["dosage"]),
    userProductId: json["userProductId"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "dosage": dosage!.name,
    "userProductId": userProductId,
  };
}

enum Dosage {
  breakfast,
  lunch,
  dinner,
  bedTime,
}

extension DosageExtension on Dosage {
  static Dosage? getValue(String value) {
    switch (value){
      case 'Breakfast':
        return Dosage.breakfast;
      
      case 'Lunch':
        return Dosage.lunch;
      
      case 'Dinner':
        return Dosage.dinner;
      
      case 'BedTime':
        return Dosage.bedTime;
      
      default:
        return null;
    }
  }

  String? get name{
    switch (this){
      case Dosage.breakfast:
        return 'Breakfast';
      
      case Dosage.lunch:
        return 'Lunch';
      
      case Dosage.dinner:
        return 'Dinner';
      
      case Dosage.bedTime:
        return 'BedTime';
      
      default:
        return '';
    }
  }
}