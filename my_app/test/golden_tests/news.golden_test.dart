import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/screens/news.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_app/design_system/cells/cards.dart';
import '../mocks/services/MockNewsService.dart';
void main() {
  testGoldens('News golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    var newsService = MockNewsService(FakeFirebaseFirestore());
    await mockNetworkImagesFor(() async {
      tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: HomePage(
              location: 'news',
              child: NewsTab(
                newsService: newsService,
              ),
            ),
          ),
        ),
      );
    });

    await screenMatchesGolden(
      tester,
      'news_page_golden',
    ); // Compare with golden image
  });
}
