import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mockito/annotations.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/services/user_service.dart';

import '../mocks/providers/MockUserProvider.dart';
import '../mocks/services/MockAuthenticationService.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([AuthenticationService])
void main() {
  testGoldens('Login golden test', (WidgetTester tester) async {
    const widget = LoginPage(); // Instantiate your HomeScreen widget

    // Create the mock provider
    final mockUserNotifier = MockUserNotifier();
    final mockAuthService = MockAuthenticationService();


    // Build the HomePage widget with the overridden provider
    tester.pumpWidget(
        ProviderScope(
            overrides:[
              userProvider.overrideWithProvider(mockUserProvider),
            ],
            child: const MaterialApp(
              home: LoginPage(),
            ),
        ),
    );
    when(AuthenticationService()).thenAnswer((_) => mockAuthService);
    await screenMatchesGolden(tester, 'login_page_golden'); // Compare with golden image
  });
}