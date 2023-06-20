

class ErrorUtils {
  static String translateErrorMessage(String errorCode) {
    switch (errorCode) {
    // Sign-in related errors
      case 'wrong-password':
        return 'Contraseña incorrecta';
      case 'user-not-found':
        return 'Usuario no encontrado';
      case 'user-disabled':
        return 'Usuario deshabilitado';

    // Registration related errors
      case 'email-already-in-use':
        return 'El correo electrónico ya está en uso';
      case 'invalid-email':
        return 'Correo electrónico inválido';
      case 'weak-password':
        return 'Contraseña débil';

    // Add more error codes and their corresponding Spanish messages as needed

      default:
        return 'Error de autenticación';
    }
  }
}