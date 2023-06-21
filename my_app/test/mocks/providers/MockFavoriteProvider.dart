import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mockito/mockito.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/providers/favorites_provider.dart';

import 'MockLocationProvider.dart';

class MockFavoriteNotifier extends StateNotifier<List<String>> implements FavoritesNotifier {
  MockFavoriteNotifier() : super([]) {
    getFavorites();
  }

  var favorites = ['1','2','3','4','5'];

  @override
  getFavorites() async {
    state = favorites;
  }

  @override
  addFavorite(VolunteerAssociation volunteerAssociation) {
    favorites.add('6');
    state = favorites;
  }

  @override
  changeFavorite(VolunteerAssociation volunteerAssociation) {
    state = favorites;
  }

  @override
  clearFavorites() {
    state = [];
  }


  @override
  removeFavorite(VolunteerAssociation volunteerAssociation) {
    favorites.remove('1');
    state = favorites;
  }
  
}


final mockFavoritesProvider = StateNotifierProvider<MockFavoriteNotifier, List<String>>((ref) {return MockFavoriteNotifier();});
