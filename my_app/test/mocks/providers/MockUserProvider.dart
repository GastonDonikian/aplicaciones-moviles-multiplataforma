import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockUserNotifier extends StateNotifier<Volunteer?> implements UserNotifier {
  MockUserNotifier() : super(null) {
    loadUserFromPrefs();
  }

  Volunteer user = Volunteer(email: 'asdfasdf@gmail.com', name: 'beto', surname: 'mendeliev');
  @override
  Future<void> loadUserFromPrefs() async {
    // Mock implementation
    state = user;
    return;
  }


  @override
  Future<void> setUser(Volunteer user) async {
    // Mock implementation
    state = this.user;
    return;
  }

  @override
  void logOut() {
    // Mock implementation
    state = null;
    return;
  }

  @override
  void clearPersistedUser() async {
    // Mock implementation
    state = null;
    return;
  }
}

final mockUserProvider = StateNotifierProvider<MockUserNotifier, Volunteer?>((ref) {return MockUserNotifier();});
