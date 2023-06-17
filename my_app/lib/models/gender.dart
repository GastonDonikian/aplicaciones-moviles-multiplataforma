enum Gender { man, woman, nonBinary }

extension GenderNaming on Gender {
  String get value {
    switch (this) {
      case Gender.man:
        return "Hombre";
      case Gender.woman:
        return "Mujer";
      case Gender.nonBinary:
        return "No Binario";
      default:
        return "";
    }
  }
}
