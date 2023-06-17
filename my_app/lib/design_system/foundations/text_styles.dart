import 'package:flutter/material.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/typos.dart';

class SerManosTextStyles extends TextStyle {
  //Headline 1
  static const String familyHead1 = SerManosTypos.familyRoboto;
  static const FontWeight fwHead1 = SerManosTypos.fwRegular;
  static const double sizeHead1 = SerManosTypos.sizeLG;

  //Headline 2
  static const String familyHead2 = SerManosTypos.familyRoboto;
  static const FontWeight fwHead2 = SerManosTypos.fwMedium;
  static const double sizeHead2 = SerManosTypos.sizeMD;

  //Subtitle 1
  static const String familySub1 = SerManosTypos.familyRoboto;
  static const FontWeight fwSub1 = SerManosTypos.fwRegular;
  static const double sizeSub1 = SerManosTypos.sizeSL;

  //Body 1
  static const String familyBody1 = SerManosTypos.familyRoboto;
  static const FontWeight fwBody1 = SerManosTypos.fwRegular;
  static const double sizeBody1 = SerManosTypos.sizeSM;

  //Body 2
  static const String familyBody2 = SerManosTypos.familyRoboto;
  static const FontWeight fwBody2 = SerManosTypos.fwRegular;
  static const double sizeBody2 = SerManosTypos.sizeXS;

  //Button
  static const String familyButton = SerManosTypos.familyRoboto;
  static const FontWeight fwButton = SerManosTypos.fwMedium;
  static const double sizeButton = SerManosTypos.sizeSM;

  //Caption
  static const String familyCaption = SerManosTypos.familyRoboto;
  static const FontWeight fwCaption = SerManosTypos.fwRegular;
  static const double sizeCaption = SerManosTypos.sizeXS;

  //Overline
  static const String familyOverline = SerManosTypos.familyRoboto;
  static const FontWeight fwOverline = SerManosTypos.fwMedium;
  static const double sizeOverline = SerManosTypos.sizeXXS;

  const SerManosTextStyles.headline1({Color? color})
      : super(
          fontFamily: familyHead1,
          fontWeight: fwHead1,
          fontSize: sizeHead1,
          color: color ?? SerManosColors.white,
        );

  const SerManosTextStyles.headline2({Color? color})
      : super(
          fontFamily: familyHead2,
          fontWeight: fwHead2,
          fontSize: sizeHead2,
          height: 1.2,
          color: color ?? SerManosColors.white,
        );

  const SerManosTextStyles.subtitle1({Color? color})
      : super(
          fontFamily: familySub1,
          fontWeight: fwSub1,
          fontSize: sizeSub1,
          height: 1.5,
          color: color ?? SerManosColors.white,
        );
  const SerManosTextStyles.body1({Color? color})
      : super(
          fontFamily: familyBody1,
          fontWeight: fwBody1,
          fontSize: sizeBody1,
          height: 1.4,
          color: color ?? SerManosColors.white,
        );

  const SerManosTextStyles.body2({Color? color})
      : super(
          fontFamily: familyBody2,
          fontWeight: fwBody2,
          fontSize: sizeBody2,
          height: 1.3,
          color: color ?? SerManosColors.white,
        );

  const SerManosTextStyles.button({Color? color})
      : super(
          fontFamily: familyButton,
          fontWeight: fwButton,
          fontSize: sizeButton,
          height: 1.4,
          color: color ?? SerManosColors.white,
        );

  const SerManosTextStyles.caption({Color? color})
      : super(
          fontFamily: familyCaption,
          fontWeight: fwCaption,
          fontSize: sizeCaption,
          height: 1.3,
          color: color ?? SerManosColors.white,
        );

  const SerManosTextStyles.overline({Color? color})
      : super(
          fontFamily: familyOverline,
          fontWeight: fwOverline,
          fontSize: sizeOverline,
          height: 1.6,
          color: color ?? SerManosColors.white,
        );
}
