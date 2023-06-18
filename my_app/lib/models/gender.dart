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

Gender? parseGender(String gender) {
  if (gender == Gender.man.value) {
    return Gender.man;
  } else if (gender == Gender.woman.value) {
    return Gender.woman;
  } else if (gender == Gender.nonBinary.value) {
    return Gender.nonBinary;
  } else {
    return null;
  }
}
