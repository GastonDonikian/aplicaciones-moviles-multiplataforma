import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:latlng/latlng.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

FakeFirebaseFirestore getInitializaedFirestoreInstance() {
  final firestoreInstance = FakeFirebaseFirestore();
  final collectionPath = 'volunteer_association';

  firestoreInstance.collection(collectionPath).doc("doc1").set({
    'address': "Fake Address 1",
    'associationType': "Accion Social",
    'capacity': 10,
    'date_creation': Timestamp.now(),
    'description': "Fake Description 1",
    'imagePath': "fakePath.png",
    'location': const GeoPoint(-34.44112875999616, -58.77390957104859),
    'name': "Fake Name 1",
    'requirements': "Fake Requirements",
    'subtitle': "Fake Subtitle 1",
    'volunteers': 0
  });

  firestoreInstance.collection(collectionPath).doc("doc2").set({
    'address': "Fake Address 2",
    'associationType': "Accion Social",
    'capacity': 10,
    'date_creation': Timestamp.now(),
    'description': "Fake Description 2",
    'imagePath': "fakePath.png",
    'location': const GeoPoint(-35.44112875999616, -59.77390957104859),
    'name': "Fake Name 2",
    'requirements': "Fake Requirements",
    'subtitle': "Fake Subtitle 2",
    'volunteers': 0
  });

  firestoreInstance.collection(collectionPath).doc("doc3").set({
    'address': "Fake Address 2",
    'associationType': "Accion Social",
    'capacity': 10,
    'date_creation': Timestamp.now(),
    'description': "Fake Description 2",
    'imagePath': "fakePath.png",
    'location': const GeoPoint(-33.44112875999616, -57.77390957104859),
    'name': "Another Fake Name",
    'requirements': "Fake Requirements",
    'schedule': "Lunes-Martes",
    'subtitle': "Fake Subtitle 2",
    'volunteers': 0
  });

  return firestoreInstance;
}

void main() {
  group('Volunteer Association Service', () {
    late VolunteerAssociationService volunteerAssociationService;
    setUp(() {
      volunteerAssociationService =
          VolunteerAssociationService(getInitializaedFirestoreInstance());
    });

    group('constructor', () {
      test('constructor should be not null', () {
        expect(VolunteerAssociationService(FakeFirebaseFirestore()), isNotNull);
      });
    });

    group('getVolunteerAssociations', () {
      test(
        'returned values should be three and the first one have name = Another Fake Name',
        () async {
          List<VolunteerAssociation> retrievedResults =
              await volunteerAssociationService.getVolunteerAssociations(
                  null, null);
          retrievedResults.sort((a, b) => a.name.compareTo(b.name));
          expect(retrievedResults.length, 3);
          expect(retrievedResults[0].name, 'Another Fake Name');
        },
      );
      test(
        'returned value should be one and have name = Fake Name 1',
        () async {
          List<VolunteerAssociation> retrievedResults =
              await volunteerAssociationService.getVolunteerAssociations(
                  "Fake Name 1", null);
          retrievedResults.sort((a, b) => a.name.compareTo(b.name));
          expect(retrievedResults.length, 1);
          expect(retrievedResults[0].name, 'Fake Name 1');
        },
      );
      test(
        'returned value should be three and the first one have name = Fake Name 1',
        () async {
          List<VolunteerAssociation> retrievedResults =
              await volunteerAssociationService.getVolunteerAssociations(
                  null, const LatLng(-34.44112875999615, -58.77390957104858));
          expect(retrievedResults.length, 3);
          expect(retrievedResults[0].name, 'Fake Name 1');
        },
      );
    });

    group('getVolunteerById tests', () {
      test('returned value should not be null and have name = Fake Name 1',
          () async {
        VolunteerAssociation? retrievedResult =
            await volunteerAssociationService.getVolunteerById("doc1");
        expect(retrievedResult, isNotNull);
        expect(retrievedResult!.name, 'Fake Name 1');
      });

      test('returned value should be null', () async {
        VolunteerAssociation? retrievedResult =
            await volunteerAssociationService.getVolunteerById("doc99");
        expect(retrievedResult, isNull);
      });
    });

    group('changeCurrentVolunteers tests', () {
      test(
        'should have changed the current volunteers by increasing one',
        () async {
          await volunteerAssociationService.changeCurrentVolunteers("doc1", 1);
          VolunteerAssociation? retrievedResult =
              await volunteerAssociationService.getVolunteerById("doc1");
          expect(retrievedResult!.volunteers, 1);
        },
      );
    });
  });
}
