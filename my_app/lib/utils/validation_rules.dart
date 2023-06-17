bool isValidEmail(String text) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
}

bool isValidPassword(String text) {
  return text.length >= 6;
}

bool isValidDate(String text) {
  return RegExp(
          r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
      .hasMatch(text);
}

String? emailValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingresa tu email';
  }
  if (!isValidEmail(value)) {
    return 'El email ingresado es invalido';
  }
  return null;
}

String? passwordValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingresa tu contraseña';
  }
  if (!isValidPassword(value)) {
    return 'La contraseña debe tener al menos 8 caracteres';
  }
  return null;
}

String? textValidation(value, field) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingresa un $field';
  } else if (RegExp(r"^[a-zA-Z ]+$").hasMatch(value)) {
    return null;
  } else {
    return 'El $field ingresado es invalido';
  }
}

String? dateValidation(value) {
  if (value == null || value.isEmpty) {
    return 'Por favor ingresa tu fecha de nacimiento';
  } else if (!isValidDate(value)) {
    return 'La fecha ingresada es invalida';
  }
  return null;
}
