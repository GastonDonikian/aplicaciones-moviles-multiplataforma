import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

class CurrentAssociationService {
  final db = FirebaseFirestore.instance;
  final String userId;
  late final String collectionPath;

  CurrentAssociationService(this.userId) {
    collectionPath = "users/$userId/currentAssociation";
  }

  Future<CurrentAssociation?> getCurrentAssociation() async {
    QuerySnapshot querySnapshot = await db.collection(collectionPath).get();
    if(querySnapshot.size == 0){
      return null;
    }
    var data = querySnapshot.docs[0].data() as Map<String, dynamic>;
    data['currentAssociation'] = await VolunteerAssociationService().getVolunteerById(data['id']);
    if(data['currentAssociation'] == null) {
      return null;
    }
    return CurrentAssociation(
      currentAssociation: data['currentAssociation'],
      confirmed: data['confirmed'],
    );
  }

  Future deleteCurrentAssociation() async {
    QuerySnapshot querySnapshot = await db.collection(collectionPath).get();
    if(querySnapshot.size == 0){
      return null;
    }

    var doc = querySnapshot.docs[0];
    var data = doc.data() as Map<String, dynamic>;
    await VolunteerAssociationService().changeCurrentVolunteers(data['id'], -1);
    await db.collection(collectionPath).doc(doc.id).delete();
    return null;
  }

  Future<CurrentAssociation?> setCurrentAssociation(String associationId) async {
    await VolunteerAssociationService().changeCurrentVolunteers(associationId, 1);
    VolunteerAssociation? vol = await VolunteerAssociationService().getVolunteerById(associationId);
    if (vol == null){
      return null;
    }
    await deleteCurrentAssociation();
    CurrentAssociation currentAssociation = CurrentAssociation(currentAssociation: vol, confirmed: false);
    await db.collection(collectionPath).add(currentAssociation.toJson());
    return currentAssociation;
  }
}