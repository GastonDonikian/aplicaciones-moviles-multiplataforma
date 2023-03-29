import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/typos.dart';

final serManosTheme = ThemeData(
    primarySwatch: SerManosColorFoundations.getMaterialColor(
        SerManosColorFoundations.statusBarColor),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: SerManosTyposFoundations.familyHead1,
          fontWeight: SerManosTyposFoundations.fwHead1,
          fontSize: SerManosTyposFoundations.sizeHead1,
        ),
        displayMedium: TextStyle(
          fontFamily: SerManosTyposFoundations.familyHead2,
          fontWeight: SerManosTyposFoundations.fwHead2,
          fontSize: SerManosTyposFoundations.sizeHead2,
        ),
        titleMedium: TextStyle(
          fontFamily: SerManosTyposFoundations.familySub1,
          fontWeight: SerManosTyposFoundations.fwSub1,
          fontSize: SerManosTyposFoundations.sizeSub1,
        ),
        bodyLarge: TextStyle(
          fontFamily: SerManosTyposFoundations.familyBody1,
          fontWeight: SerManosTyposFoundations.fwBody1,
          fontSize: SerManosTyposFoundations.sizeBody1,
        ),
        bodyMedium: TextStyle(
          fontFamily: SerManosTyposFoundations.familyBody2,
          fontWeight: SerManosTyposFoundations.fwBody2,
          fontSize: SerManosTyposFoundations.sizeBody2,
        ),
        labelLarge: TextStyle(
            fontFamily: SerManosTyposFoundations.familyButton,
            fontWeight: SerManosTyposFoundations.fwButton,
            fontSize: SerManosTyposFoundations.sizeButton),
        bodySmall: TextStyle(
            fontFamily: SerManosTyposFoundations.familyCaption,
            fontWeight: SerManosTyposFoundations.fwCaption,
            fontSize: SerManosTyposFoundations.sizeCaption),
        labelSmall: TextStyle(
            fontFamily: SerManosTyposFoundations.familyOverline,
            fontWeight: SerManosTyposFoundations.fwOverline,
            fontSize: SerManosTyposFoundations.sizeOverline)));
