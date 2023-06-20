import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/volunteer_association.dart';

class VolunteerAssociationService {
  final db = FirebaseFirestore.instance;
  final collectionPath = 'volunteer_association';

  Future createVolunteerAssociation(VolunteerAssociation volunteerAssociation) async {
    return db.collection(collectionPath).add(volunteerAssociation.toJson());
  }

  Future getVolunteerAssociations(String? query) async {
    QuerySnapshot querySnapshot = await db.collection(collectionPath).orderBy('date_creation', descending: true).get();
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
    }
    return associations;
  }

  getVolunteerById(String id) async {
    try {
      var volunteerDoc = await FirebaseFirestore.instance
          .collection(collectionPath)
          .doc(id)
          .get();
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

  changeCurrentCapacity(String associationId, int add) async {
    VolunteerAssociation currentAssoc = getVolunteerById(associationId);
    currentAssoc.volunteers += add;
    await FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(associationId)
        .set(currentAssoc.toJson());
  }
}
