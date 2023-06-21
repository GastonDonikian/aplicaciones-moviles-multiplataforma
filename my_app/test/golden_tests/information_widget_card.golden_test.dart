import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../mocks/services/MockNewsService.dart';

void main() {
  testGoldens('Information card widget golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(
                home: SerManosInformationCard(cardTitle: 'asdf' ,information: {'asdf':'asdf'},)
            ),
          ),
    );

    await screenMatchesGolden(
        tester, 'information_card_widget_golden'); // Compare with golden image
  });
}
