import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/text_styles.dart';

class SerManosTexts extends Text {
  SerManosTexts.headline1(super.text,
      {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.headline1(color: color));

  SerManosTexts.headline2(super.text,
      {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.headline2(color: color));

  SerManosTexts.subtitle1(super.text,
      {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.subtitle1(color: color));

  SerManosTexts.body1(super.text, {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.body1(color: color));

  SerManosTexts.body2(super.text, {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.body2(color: color));

  SerManosTexts.button(super.text, {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.button(color: color));

  SerManosTexts.caption(super.text, {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.caption(color: color));

  SerManosTexts.overline(super.text, {super.key, Color? color, super.textAlign})
      : super(style: SerManosTextStyles.overline(color: color));
}
