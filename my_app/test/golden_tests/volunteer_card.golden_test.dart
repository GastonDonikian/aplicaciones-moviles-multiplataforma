import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mocks/services/MockNewsService.dart';

void main() {
  testGoldens('Volunteer card widget golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    await mockNetworkImagesFor(() async {
      tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Material(child: SerManosVolunteerCard(isFavorite: false,
              imagePath: 'www.google.com',
              cardOverlineText: 'asdf',
              cardTitle: 'asdf',
              vacancy: 2,
              onPressedFav: () {},
              onPressedImage: () {},
              onPressedLocation: () {},)
            ),
          ),
        ),
      );
    });
    await screenMatchesGolden(
          tester, 'volunteer_card_widget_golden');
    } // Compare with golden image
  );
}
