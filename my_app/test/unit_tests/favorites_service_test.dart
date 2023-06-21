import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/favorites_service.dart';

FakeFirebaseFirestore getInitializedFirestoreInstance() {
  final firestoreInstance = FakeFirebaseFirestore();
  const collectionPath = "users";
  const userId = "user1";

  firestoreInstance.collection(collectionPath).doc("user1").set({
    'email': "fake@email.com",
    'name': "Fake User 1",
    'surname': "Fake Surname 1",
    'profileCompleted': false,
  });

  firestoreInstance.collection("users/$userId/favorites").doc("fav1").set(
    {"volunteer_association": "assoc1"},
  );

  firestoreInstance.collection("users/$userId/favorites").doc("fav2").set(
    {"volunteer_association": "assoc2"},
  );

  return firestoreInstance;
}

void main() {
  group('Favorites Service', () {
    late FavoritesService favoritesService;
    VolunteerAssociation assoc1 = VolunteerAssociation(
        id: "assoc1",
        imagePath: "fake.png",
        associationType: "Accion Social",
        name: "Assoc1",
        subtitle: "Fake Subtitle 1",
        location: const GeoPoint(-35.44112875999616, -59.77390957104859),
        address: "Fake Address 1",
        description: "Fake Description 1",
        capacity: 10,
        volunteers: 0,
        requirements: "Fake Requirenments 1",
        isFavorite: true);
    VolunteerAssociation assoc3 = VolunteerAssociation(
        id: "assoc3",
        imagePath: "fake.png",
        associationType: "Accion Social",
        name: "Assoc1",
        subtitle: "Fake Subtitle 3",
        location: const GeoPoint(-35.44112875999616, -59.77390957104859),
        address: "Fake Address 3",
        description: "Fake Description 3",
        capacity: 10,
        volunteers: 0,
        requirements: "Fake Requirenments 3",
        isFavorite: false);

    setUp(() {
      favoritesService =
          FavoritesService("user1", getInitializedFirestoreInstance());
    });

    group('constructor', () {
      test('constructor should be not null', () {
        expect(FavoritesService("user1", FakeFirebaseFirestore()), isNotNull);
      });
    });

    group('getFavorites tests', () {
      test('returned values should be two', () async {
        List<String> retrievedFavorites = await favoritesService.getFavorites();
        expect(retrievedFavorites.length, 2);
      });
    });

    group('changeFavorite tests', () {
      test('favourite for assoc1 should be eliminated', () async {
        favoritesService.changeFavorite(assoc1).then((value) async {
          List<String> retrievedFavorites =
              await favoritesService.getFavorites();
          expect(retrievedFavorites.length, 1);
          expect(retrievedFavorites[0], "assoc2");
        });
      });
      test('favourite for assoc3 should be added', () async {
        favoritesService.changeFavorite(assoc3).then((value) async {
          List<String> retrievedFavorites =
              await favoritesService.getFavorites();
          retrievedFavorites.sort(
            (a, b) => a.compareTo(b),
          );
          expect(retrievedFavorites.length, 3);
          expect(retrievedFavorites[retrievedFavorites.length - 1], "assoc3");
        });
      });
    });
  });
}
