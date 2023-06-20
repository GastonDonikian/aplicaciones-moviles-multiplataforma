import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlng/latlng.dart';
import '../models/volunteer_association.dart';

class VolunteerAssociationService {
  final collectionPath = 'volunteer_association';

  Future createVolunteerAssociation(VolunteerAssociation volunteerAssociation) async {
    return FirebaseFirestore.instance.collection(collectionPath).add(volunteerAssociation.toJson());
  }

  Future getVolunteerAssociations(String? query, LatLng? userPosition) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionPath).orderBy('date_creation', descending: true).get();
    List<VolunteerAssociation> associations = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
      var item = VolunteerAssociation.fromJson(data);
      if (query == null) {
        associations.add(item);
      } else {
        if (item.name.toLowerCase().contains(query.toLowerCase().trim())) {
          associations.add(item);
        }
      }
      if (userPosition != null) {
        item.distance = item.calculateDistance(userPosition.latitude, userPosition.longitude);
      }
    }

    if (userPosition != null) {
      associations.sort((a, b) => a.distance!.compareTo(b.distance!));
    }

    return associations;
  }

  Future<VolunteerAssociation?> getVolunteerById(String id) async {
    try {
      var volunteerDoc = await FirebaseFirestore.instance.collection(collectionPath).doc(id).get();
      if (volunteerDoc.exists) {
        var volunteerData = volunteerDoc.data() as Map<String, dynamic>;
        volunteerData['id'] = volunteerDoc.id;
        return VolunteerAssociation.fromJson(volunteerData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> changeCurrentVolunteers(String associationId, int add) async {
    VolunteerAssociation? currentAssoc = await getVolunteerById(associationId);
    if (currentAssoc == null) {
      return;
    }
    currentAssoc.volunteers += add;
    await FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(associationId)
        .update({'volunteers': currentAssoc.volunteers});
  }
}
