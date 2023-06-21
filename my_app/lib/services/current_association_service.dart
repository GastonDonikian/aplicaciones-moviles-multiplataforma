import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

import 'analytics_service.dart';

class CurrentAssociationService {
  final String userId;
  late final String collectionPath;
  FirebaseFirestore? instance;
  VolunteerAssociationService? volunteerAssociationService;
  AnalyticsService? analyticsService;

  CurrentAssociationService(this.userId,
      [this.instance,
      this.volunteerAssociationService,
      this.analyticsService]) {
    collectionPath = "users/$userId/currentAssociation";

    if (instance == null) {
      instance = FirebaseFirestore.instance;
    } else {
      instance = instance;
    }

    if (volunteerAssociationService == null) {
      volunteerAssociationService = VolunteerAssociationService();
    } else {
      volunteerAssociationService = volunteerAssociationService;
    }

    if (analyticsService == null) {
      analyticsService = AnalyticsService();
    } else {
      analyticsService = analyticsService;
    }
  }

  Future<CurrentAssociation?> getCurrentAssociation() async {
    QuerySnapshot querySnapshot =
        await instance!.collection(collectionPath).get();
    if (querySnapshot.size == 0) {
      return null;
    }
    var data = querySnapshot.docs[0].data() as Map<String, dynamic>;
    data['currentAssociation'] =
        await volunteerAssociationService!.getVolunteerById(data['id']);
    if (data['currentAssociation'] == null) {
      return null;
    }
    return CurrentAssociation(
      currentAssociation: data['currentAssociation'],
      confirmed: data['confirmed'],
    );
  }

  Future deleteCurrentAssociation() async {
    QuerySnapshot querySnapshot =
        await instance!.collection(collectionPath).get();
    if (querySnapshot.size == 0) {
      return null;
    }

    var doc = querySnapshot.docs[0];
    var data = doc.data() as Map<String, dynamic>;
    if (data['confirmed']) {
      await volunteerAssociationService!
          .changeCurrentVolunteers(data['id'], -1);
    }
    analyticsService!.unsubscribeToActivityEvent(data['id'], userId);
    await instance!.collection(collectionPath).doc(doc.id).delete();
    return null;
  }

  Future<CurrentAssociation?> setCurrentAssociation(
    String associationId,
  ) async {
    VolunteerAssociation? vol =
        await volunteerAssociationService!.getVolunteerById(associationId);
    if (vol == null) {
      return null;
    }
    await deleteCurrentAssociation();
    analyticsService!.subscribeToActivityEvent(associationId, userId);
    CurrentAssociation currentAssociation =
        CurrentAssociation(currentAssociation: vol, confirmed: false);
    await instance!.collection(collectionPath).add(currentAssociation.toJson());
    return currentAssociation;
  }
}
