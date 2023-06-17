

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../models/volunteer.dart';

const collection = "users";

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
      var userCredentials = await _authenticator.createUserWithEmailAndPassword(
          email: email, password: password);
      String userId = userCredentials.user!.uid;
      await FirebaseFirestore.instance.collection('users').doc(userId).set({
        'name': name,
        'surname': surname,
        'email': email,
      });
    }
    on FirebaseAuthException catch (e) {
      FirebaseCrashlytics.instance.log("Error singUp: $e");
    }
  }

  Future<Volunteer?> getUserById(String userId) async {
    try {
      var userDoc = await FirebaseFirestore.instance.collection('users').doc(userId).get();

      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>;

        return Volunteer.fromJson(userData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  void editUser(String userId, Map<String, dynamic> json) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).set(json);
  }

}