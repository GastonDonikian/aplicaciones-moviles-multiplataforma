import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

class FavoritesService {
  late final String collectionPath;
  final String userId;
  FirebaseFirestore? instance;

  FavoritesService(this.userId, [this.instance]) {
    collectionPath = "users/$userId/favorites";
    if (instance == null) {
      instance = FirebaseFirestore.instance;
    } else {
      instance = instance;
    }
  }

  Future getFavorites() async {
    QuerySnapshot querySnapshot =
        await instance!.collection(collectionPath).get();
    List<String> favorites = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      favorites.add(data['volunteer_association']);
    }
    return favorites;
  }

  Future changeFavorite(VolunteerAssociation association) async {
    if (association.isFavorite) {
      return instance!
          .collection(collectionPath)
          .where('volunteer_association', isEqualTo: association.id)
          .get()
          .then((snapshot) {
        snapshot.docs.first.reference.delete();
      });
    } else {
      return instance!
          .collection(collectionPath)
          .add({'volunteer_association': association.id});
    }
  }
}
