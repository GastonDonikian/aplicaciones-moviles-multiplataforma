import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

class FavoritesService {
  late final String collectionPath;
  final String userId;

  FavoritesService(this.userId) {
    collectionPath = "users/$userId/favorites";
  }

  Future getFavorites() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionPath).get();
    List<String> favorites = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      favorites.add(data['volunteer_association']);
    }
    return favorites;
  }

  Future changeFavorite(VolunteerAssociation association) async {
    if (association.isFavorite) {
      return FirebaseFirestore.instance
          .collection(collectionPath)
          .where('volunteer_association', isEqualTo: association.id)
          .get()
          .then((snapshot) {
        snapshot.docs.first.reference.delete();
      });
    } else {
      return FirebaseFirestore.instance.collection(collectionPath).add({'volunteer_association': association.id});
    }
  }
}
