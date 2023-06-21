import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/pages/volunteer_association.dart';
import 'package:my_app/providers/current_association_provider.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../mocks/providers/MockCurrentVolunteerAssociationProvider.dart';
import '../mocks/providers/MockUserProvider.dart';

void main() {
  testGoldens('Volunteer association golden test', (WidgetTester tester) async {
    // Create the mock provider
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

    // Build the HomePage widget with the overridden provider
    await mockNetworkImagesFor(() => tester.pumpWidget(
          ProviderScope(
            overrides: [
              userProvider.overrideWithProvider(mockUserProvider),
              currentAssociationProvider
                  .overrideWithProvider(mockCurrentAssociationProvider),
            ],
            child: MaterialApp(
              home: VolunteerAssociationPage(
                id: '123',
                maybeVolunteerAssociation: volunteerAssociation,
              ),
            ),
          ),
        ));
    await screenMatchesGolden(tester,
        'volunteer_association_page_golden'); // Compare with golden image
  });
}
