enum Dosage {
  breakfast,
  lunch,
  dinner,
  bedtime,
}

extension DosageExtension on Dosage {
  static Dosage? getValue(String value) {
    
    switch (value.toLowerCase()){
      case 'breakfast':
        return Dosage.breakfast;
      
      case 'lunch':
        return Dosage.lunch;
      
      case 'dinner':
        return Dosage.dinner;
      
      case 'bedtime':
        return Dosage.bedtime;
      
      default:
        return null;
    }
  }
}