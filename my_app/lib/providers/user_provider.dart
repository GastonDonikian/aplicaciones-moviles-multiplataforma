import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserNotifier extends StateNotifier<Volunteer?> {
  UserNotifier() : super(null) {
    _loadUserFromPrefs();
  }

  void _loadUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return;
    }
    final extractedUserData = json.decode(prefs.getString('userData')!) as Map<String, dynamic>;
    state = Volunteer.fromJson(extractedUserData);
  }

  void _saveUserToPrefs(Volunteer user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', json.encode(state!.toJson()));
  }

  void setUser(Volunteer user) async {
    state = user;
    _saveUserToPrefs(user);
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    state = null;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Volunteer?>((ref) {
  return UserNotifier();
});
