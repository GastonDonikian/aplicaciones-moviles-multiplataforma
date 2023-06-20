import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/services/current_association_service.dart';

class CurrentAssociationNotifier extends StateNotifier<CurrentAssociation?> {
  CurrentAssociationNotifier() : super (null) {
    getCurrentAssociation();
  }

  getCurrentAssociation() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    state = await CurrentAssociationService(userId).getCurrentAssociation();
  }

  unsubscribeFromCurrentAssociation() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    await CurrentAssociationService(userId).deleteCurrentAssociation();
    state = null;
  }

  subscribeToAssociation(String associationId) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    var currentAssoc = await CurrentAssociationService(userId).setCurrentAssociation(associationId);
    if(currentAssoc == null){
      return null;
    }
    state = currentAssoc;
  }

}

final currentAssociationProvider = StateNotifierProvider<CurrentAssociationNotifier, CurrentAssociation?>((ref) {
  return CurrentAssociationNotifier();
});
