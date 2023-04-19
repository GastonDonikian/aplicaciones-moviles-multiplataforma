import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: SerManosColorFoundations.getMaterialColor(
            SerManosColorFoundations.statusBarColor),
      ),
      home: const HomePage(),
    );
  }
}
