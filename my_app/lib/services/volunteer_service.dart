
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/volunteer_association.dart';


class NewsService {
  final db = FirebaseFirestore.instance;
  final collectionPath = 'volunteer_association';

  Future createVolunteerAssociation(VolunteerAssociation volunteerAssociation) async {
    return db.collection(collectionPath).add(volunteerAssociation.toJson());
  }

  Future getAllVolunteerAssociation() async {
    return await db.collection(collectionPath).get();
  }
}
