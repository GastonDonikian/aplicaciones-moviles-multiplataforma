
import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/services/analytics_service.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/services/navigation_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/services/news_service.dart';
import 'firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'models/news.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const MyApp());

}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: SerManosColorFoundations.getMaterialColor(SerManosColorFoundations.statusBarColor),
      ),
      routerConfig: router,
    );
  }
}
