import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/pages/not_found.dart';
import 'package:my_app/screens/news.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mocks/services/MockNewsService.dart';

void main() {
  testGoldens('News golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    var newsService = MockNewsService(FakeFirebaseFirestore());
    await mockNetworkImagesFor(() => tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              home: NewsTab(
                newsService: newsService,
              ),
            ),
          ),
        ));
    await screenMatchesGolden(
        tester, 'news_page_golden'); // Compare with golden image
  });
}
