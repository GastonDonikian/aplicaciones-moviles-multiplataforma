import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends StateNotifier<Volunteer?> {
  UserNotifier() : super(null) {
    loadUserFromPrefs();
  }

  Future<void> loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    }
    final extractedUserData = json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    state = Volunteer.fromJson(extractedUserData);
  }

  Future<void> _saveUserToPrefs(Volunteer user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', json.encode(state!.toJson()));
  }

  Future<void> setUser(Volunteer user) async {
    state = user;
    await _saveUserToPrefs(user);
  }

  void logOut() {
    AuthenticationService().signOut();
    state = null;
    clearPersistedUser();
  }

  void clearPersistedUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Volunteer?>((ref) {
  return UserNotifier();
});