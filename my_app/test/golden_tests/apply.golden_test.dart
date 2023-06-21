import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/not_found.dart';
import 'package:my_app/providers/current_association_provider.dart';
import 'package:my_app/providers/favorites_provider.dart';
import 'package:my_app/providers/location_provider.dart';
import 'package:my_app/screens/apply.dart';
import 'package:my_app/screens/news.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mocks/providers/MockCurrentVolunteerAssociationProvider.dart';
import '../mocks/providers/MockFavoriteProvider.dart';
import '../mocks/providers/MockLocationProvider.dart';
import '../mocks/services/MockNewsService.dart';
import '../mocks/services/MockVolunteerAssociationService.dart';

// TODO: Agregar providers mockeados a todos los tests que no lo tengan.
void main() {
  testGoldens('Apply golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    var mockVolunteerAssociationService =
        MockVolunteerAssociationService(FakeFirebaseFirestore());
    var mockVolunteerAssociationProvider = mockCurrentAssociationProvider;
    await mockNetworkImagesFor(() => tester.pumpWidget(
          ProviderScope(
            overrides: [
              favoritesProvider.overrideWithProvider(mockFavoritesProvider),
              locationProvider.overrideWithProvider(mockLocationProvider),
              currentAssociationProvider
                  .overrideWithProvider(mockVolunteerAssociationProvider),
            ],
            child: MaterialApp(
              home: HomePage(
                location: 'apply',
                child: ApplyTab(
                  volunteerAssociationService: mockVolunteerAssociationService,
                ),
              ),
            ),
          ),
        ));
    await screenMatchesGolden(
        tester, 'apply_page_golden'); // Compare with golden image
  });
}
