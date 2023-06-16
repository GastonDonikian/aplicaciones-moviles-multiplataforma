bool isValidEmail(String text) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
}

bool isValidPassword(String text) {
  return text.length >= 6;
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
