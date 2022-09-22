enum Dosage {
  breakfast,
  lunch,
  dinner,
  bedtime,
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
      
      case 'Bedtime':
        return Dosage.bedtime;
      
      default:
        return null;
    }
  }
}