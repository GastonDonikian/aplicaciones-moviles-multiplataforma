import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_app/pages/edit_profile.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:network_image_mock/network_image_mock.dart';
import '../mocks/providers/MockUserProvider.dart';
import '../mocks/services/MockAuthenticationService.dart';
import '../mocks/services/MockImagesService.dart';


void main() {
  testGoldens('Edit profile golden test', (WidgetTester tester) async {
    // Build the HomePage widget with the overridden provider
    var imageService = MockImagesService();
    var userService = MockAuthenticationService();
    await mockNetworkImagesFor(() => tester.pumpWidget(
      ProviderScope(
        overrides:[
          userProvider.overrideWithProvider(mockUserProvider),
        ],

        child: MaterialApp(
          home: EditProfilePage(authService: userService,imageService: imageService,),
        ),
      ),
    ));
    await screenMatchesGolden(tester, 'edit_profile_page_golden'); // Compare with golden image
  });
}