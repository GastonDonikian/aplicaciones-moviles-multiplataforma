import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/providers/current_association_provider.dart';

class MockCurrentVolunteerAssociationProvider
    extends StateNotifier<CurrentAssociation?>
    implements CurrentAssociationNotifier {
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
  late CurrentAssociation currentAssociation;

  MockCurrentVolunteerAssociationProvider(super._state) {
    currentAssociation = CurrentAssociation(
        currentAssociation: volunteerAssociation, confirmed: false);
  }

  @override
  getCurrentAssociation() {
    // TODO : implement getCurrentAssociation
    state = currentAssociation;
    return currentAssociation;
  }

  @override
  subscribeToAssociation(String associationId) {
    // TODO: implement subscribeToAssociation
    state = currentAssociation;
    return currentAssociation;
  }

  @override
  unsubscribeFromCurrentAssociation() {
    // TODO: implement unsubscribeFromCurrentAssociation
    state = currentAssociation;
    return currentAssociation;
  }
}

final mockCurrentAssociationProvider = StateNotifierProvider<
    MockCurrentVolunteerAssociationProvider, CurrentAssociation?>((ref) {
  return MockCurrentVolunteerAssociationProvider(null);
});
