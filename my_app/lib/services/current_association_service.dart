import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/services/volunteer_service.dart';

class CurrentAssociationService {
  final db = FirebaseFirestore.instance;
  final String userId;
  late final String collectionPath;

  CurrentAssociationService(this.userId) {
    collectionPath = "users/$userId/currentAssociation";
  }

  Future getCurrentAssociation() async {
    QuerySnapshot querySnapshot = await db.collection(collectionPath).get();
    if(querySnapshot.size == 0){
      return null;
    }
    var data = querySnapshot.docs[0].data() as Map<String, dynamic>;
    data['currentAssociation'] = await VolunteerAssociationService().getVolunteerById(data['id']);
    return CurrentAssociation.fromJson(data);
  }

  Future deleteCurrentAssociation() async {
    QuerySnapshot querySnapshot = await db.collection(collectionPath).get();
    if(querySnapshot.size == 0){
      return null;
    }
    var doc = querySnapshot.docs[0];
    var data = doc.data() as Map<String, dynamic>;
    await VolunteerAssociationService().changeCurrentCapacity(data['id'], 1);
    await db.collection(collectionPath).doc(doc.id).delete();
    return null;
  }

  Future setCurrentAssociation(String associationId) async {
    await db.collection(collectionPath).add({'id': associationId, 'confirmed': false});
    await VolunteerAssociationService().changeCurrentCapacity(associationId, -1);
  }
}