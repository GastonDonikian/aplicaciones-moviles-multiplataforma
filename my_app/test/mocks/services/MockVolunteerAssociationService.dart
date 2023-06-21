import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlng/latlng.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/services/volunteer_service.dart';

class MockVolunteerAssociationService extends VolunteerAssociationService {
  final VolunteerAssociation volunteerAssociation = VolunteerAssociation(
      id: '123',
      imagePath: '',
      associationType: 'asdf',
      name: 'asdf',
      subtitle: 'asdf',
      location: GeoPoint(12, 23),
      address: 'asdf',
      description: 'asdf',
      capacity: 10,
      volunteers: 2,
      requirements: 'asdf');

  MockVolunteerAssociationService(super.instance);

  @override
  Future createVolunteerAssociation(
      VolunteerAssociation volunteerAssociation) async {
    return this.volunteerAssociation;
  }

  @override
  Future getVolunteerAssociations(String? query, LatLng? userPosition) async {
    return volunteerAssociation;
  }

  @override
  Future<VolunteerAssociation?> getVolunteerById(String id) async {
    return volunteerAssociation;
  }

  @override
  Future<void> changeCurrentVolunteers(String associationId, int add) async {
    return;
  }
}
