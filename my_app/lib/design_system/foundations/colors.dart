import 'package:flutter/material.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class SerManosColorFoundations {
  SerManosColorFoundations._();

  //status bar
  static const statusBarColor = SerManosColors.secondary90;

  //button
  static const buttonEnabledColor = SerManosColors.grey75;
  static const buttonDisabledColor = SerManosColors.grey25;
  static const buttonActiveColor = SerManosColors.primary;
  static const buttonErrorColor = SerManosColors.error;

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
