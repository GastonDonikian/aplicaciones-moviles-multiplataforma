

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class AuthenticationService {
  final FirebaseAuth _authenticator = FirebaseAuth.instance;

  Future signIn(String email, String password) async {
    try {
      return await _authenticator.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      FirebaseCrashlytics.instance.log("Error singIn: $e");
    }
  }

  Future signUp(String name, String surname, String email, String password) async {
    try {
      // TODO: Link with FireStore extra data
      return await _authenticator.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      FirebaseCrashlytics.instance.log("Error singUp: $e");
    }
  }
}