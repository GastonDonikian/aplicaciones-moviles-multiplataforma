import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockUserNotifier extends StateNotifier<Volunteer?> implements UserNotifier {
  MockUserNotifier() : super(null) {}
  @override
  Future<void> loadUserFromPrefs() async {
    // Mock implementation
  }


  Future<void> setUser(Volunteer user) async {
    // Mock implementation
    state = user;
  }

  void logOut() {
    // Mock implementation
    state = null;
  }

  void clearPersistedUser() async {
    // Mock implementation
  }
}

final mockUserProvider = StateNotifierProvider<MockUserNotifier, Volunteer?>((ref) {return MockUserNotifier();});
