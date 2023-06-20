import 'dart:io';

import 'package:my_app/models/gender.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/services/user_service.dart';


const collection = "users";

class MockAuthenticationService extends AuthenticationService {
  final Volunteer volunteer = Volunteer(email: "gastondonikian@gmail.com", name: 'Gaston', surname: 'Donikian');
  @override
  Future signIn(String email, String password) async {
    // Empty implementation
    return volunteer;
  }

  @override
  Future signOut() async {
    return;
    // Empty implementation
  }

  @override
  Future signUp(String name, String surname, String email, String password) async {
    // Empty implementation
    return;
  }

  @override
  Future<Volunteer?> getCurrentUser() async {
    // Empty implementation
    return volunteer;
  }

  @override
  Future<Volunteer?> getUserById(String userId) async {
    // Empty implementation
    return volunteer;
  }

  @override
  Future<Volunteer?> editUser(
      DateTime birthDate, Gender gender, String? imagePath, String phone, File? imageFile) async {
    // Empty implementation
    return volunteer;
  }
}
