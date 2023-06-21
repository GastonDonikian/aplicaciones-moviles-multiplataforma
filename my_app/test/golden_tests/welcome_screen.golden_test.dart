import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/pages/welcome.dart';


void main() {
  testGoldens('Welcome golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: WelcomePage(),
        ),
      ),
    );
    await screenMatchesGolden(tester, 'welcome_page_golden'); // Compare with golden image
  });
}