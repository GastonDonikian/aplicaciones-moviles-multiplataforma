import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/models/gender.dart';
import 'package:my_app/services/images_service.dart';

import '../models/volunteer.dart';
import 'analytics_service.dart';

const collection = "users";

class AuthenticationService {
  final FirebaseAuth _authenticator = FirebaseAuth.instance;
  final ImagesService _imagesService = ImagesService();

  Future signIn(String email, String password) async {

    UserCredential user = await _authenticator.signInWithEmailAndPassword(
        email: email, password: password);
    AnalyticsService().loginEvent(user.user!.uid);
    return user;
  }

  Future signOut() async {
    return await _authenticator.signOut();
  }

  Future signUp(
      String name, String surname, String email, String password) async {
    var userCredentials = await _authenticator.createUserWithEmailAndPassword(
        email: email, password: password);
    String userId = userCredentials.user!.uid;
    AnalyticsService().signupEvent(userId);
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'name': name,
      'surname': surname,
      'email': email,
      'profileCompleted': false
    });
  }

  Future<Volunteer?> getCurrentUser() async {
    final currentUser = _authenticator.currentUser;
    if (currentUser != null) {
      return getUserById(currentUser.uid);
    }
    return null;
  }

  Future<Volunteer?> getUserById(String userId) async {
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

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

  Future<Volunteer?> editUser(DateTime birthDate, Gender gender,
      String? imagePath, String phone, File? imageFile) async {
    Volunteer? currentUser = await getCurrentUser();
    currentUser = currentUser!;
    currentUser.birthDate = birthDate;
    currentUser.gender = gender;
    currentUser.phone = phone;
    currentUser.profileCompleted = true;

    var currentUid = _authenticator.currentUser!.uid;
    if (imageFile != null) {
      var newImagePath =
          await _imagesService.uploadUserImage(currentUid, imageFile);
      if (newImagePath != null) {
        currentUser.imagePath = newImagePath;
      }
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUid)
        .set(currentUser.toJson());
    return currentUser;
  }
}
