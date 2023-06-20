import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/providers/favorites_provider.dart';
import 'package:my_app/providers/user_provider.dart';

import 'current_association_provider.dart';

class AuthNotifier extends StateNotifier<bool> {
  Ref ref;
  AuthNotifier(this.ref) : super(false) {
    ref.listen(userProvider, (previousState, nextState) {
      if (previousState == null && nextState != null) {
        ref.read(favoritesProvider.notifier).getFavorites();
        ref.read(currentAssociationProvider.notifier).getCurrentAssociation();
        state = true;
      } else if (previousState != null && nextState == null) {
        ref.read(favoritesProvider.notifier).clearFavorites();
        state = false;
      }
    });
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, bool>((ref) {
  return AuthNotifier(ref);
});
