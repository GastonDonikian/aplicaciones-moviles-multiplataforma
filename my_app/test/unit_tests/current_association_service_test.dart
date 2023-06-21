import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/services/current_association_service.dart';

import '../mocks/services/MockAnalyticsService.dart';
import '../mocks/services/MockVolunteerAssociationService.dart';

FakeFirebaseFirestore getInitializedFirestoreInstance() {
  final firestoreInstance = FakeFirebaseFirestore();
  const collectionPath = "users";
  const userId = "user1";

  firestoreInstance.collection(collectionPath).doc(userId).set({
    'email': "fake@email.com",
    'name': "Fake User 1",
    'surname': "Fake Surname 1",
    'profileCompleted': false,
    'birthDate': Timestamp.now(),
    'confirmedByAssociation': 'true',
    'phone': '+549113476574',
    'gender': 'Hombre',
  });

  firestoreInstance
      .collection("users/$userId/currentAssociation")
      .doc("curr1")
      .set(
    {"id": "assoc1", "confirmed": true},
  );

  return firestoreInstance;
}

void main() {
  group('Current Association Service', () {
    late CurrentAssociationService currentAssociationService;

    setUp(() {
      var instance = getInitializedFirestoreInstance();
      currentAssociationService = CurrentAssociationService("user1", instance,
          MockVolunteerAssociationService(instance), MockAnalyticsService());
    });

    group('constructor', () {
      test('constructor should be not null', () {
        expect(
            CurrentAssociationService(
                "user1",
                FakeFirebaseFirestore(),
                MockVolunteerAssociationService(FakeFirebaseFirestore()),
                MockAnalyticsService()),
            isNotNull);
      });
    });

    group('getCurrenAssociation tests', () {
      test(
          'returned values should not be null and have association id = assoc1',
          () async {
        CurrentAssociation? retrievedCurrentAssociation =
            await currentAssociationService.getCurrentAssociation();
        expect(retrievedCurrentAssociation, isNotNull);
        expect(retrievedCurrentAssociation!.currentAssociation, isNotNull);
        expect(retrievedCurrentAssociation.currentAssociation.id, "assoc1");
      });
    });

    group('deleteCurrentAssociation tests', () {
      test('should delete current association', () async {
        currentAssociationService.deleteCurrentAssociation().then(
          (value) async {
            CurrentAssociation? retrievedCurrentAssociation =
                await currentAssociationService.getCurrentAssociation();
            expect(retrievedCurrentAssociation, isNull);
          },
        );
      });
    });

    group('setCurrentAssociation tests', () {
      test('should delete current association', () async {
        currentAssociationService.setCurrentAssociation("assoc2").then(
          (value) async {
            CurrentAssociation? retrievedCurrentAssociation =
                await currentAssociationService.getCurrentAssociation();
            expect(retrievedCurrentAssociation, isNotNull);
            expect(retrievedCurrentAssociation!.currentAssociation, isNotNull);
            expect(retrievedCurrentAssociation.currentAssociation.id, "assoc2");
          },
        );
      });
    });
  });
}
