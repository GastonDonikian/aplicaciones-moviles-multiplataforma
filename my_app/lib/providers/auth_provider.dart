import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers/user_provider.dart';

class AuthNotifier extends StateNotifier<bool> {
  Ref ref;
  AuthNotifier(this.ref) : super(false) {
    ref.listen(userProvider, (previousState, nextState) {
      if (previousState == null && nextState != null) {
        state = true;
      } else if (previousState != null && nextState == null) {
        state = false;
      }
    });
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref);
});
