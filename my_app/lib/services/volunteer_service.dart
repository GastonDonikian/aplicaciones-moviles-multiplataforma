import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/volunteer_association.dart';

class VolunteerAssociationService {
  final db = FirebaseFirestore.instance;
  final collectionPath = 'volunteer_association';

  Future createVolunteerAssociation(VolunteerAssociation volunteerAssociation) async {
    return db.collection(collectionPath).add(volunteerAssociation.toJson());
  }

  Future getVolunteerAssociations(int page, int pageSize) async {
    QuerySnapshot querySnapshot = await db.collection(collectionPath).get();
    List<VolunteerAssociation> associations = [];
    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;
      var item = VolunteerAssociation.fromJson(data);
      associations.add(item);
    }
    return associations;
  }
}
