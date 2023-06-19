import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/favorites_service.dart';

class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier() : super([]) {
    getFavorites();
  }

  getFavorites() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    state = await FavoritesService(userId).getFavorites();
  }

  addFavorite(VolunteerAssociation volunteerAssociation) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    await FavoritesService(userId).changeFavorite(volunteerAssociation);
    state = [...state, volunteerAssociation.id];
  }

  removeFavorite(VolunteerAssociation volunteerAssociation) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }
    String userId = user.uid;
    await FavoritesService(userId).changeFavorite(volunteerAssociation);
    var aux = [...state];
    aux.remove(volunteerAssociation.id);
    state = aux;
  }

  changeFavorite(VolunteerAssociation volunteerAssociation) async {
    if (volunteerAssociation.isFavorite) {
      await removeFavorite(volunteerAssociation);
    } else {
      await addFavorite(volunteerAssociation);
    }
  }

  clearFavorites() {
    state = [];
  }
}

var favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
  return FavoritesNotifier();
});
