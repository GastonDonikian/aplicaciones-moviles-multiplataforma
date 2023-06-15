import 'package:flutter/material.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class SerManosColorFoundations {
  SerManosColorFoundations._();

  //text
  static const defaultTextColor = SerManosColors.white;

  //status bar
  static const statusBarColor = SerManosColors.secondary90;

  //icon
  static const iconEnabledColor = SerManosColors.grey75;
  static const iconDisabledColor = SerManosColors.grey25;
  static const iconActiveColor = SerManosColors.primary100;
  static const personIconEnabledColor = SerManosColors.grey75;
  static const personIconColor = SerManosColors.secondary80;
  static const personIconActiveColor = SerManosColors.secondary200;

  //button
  static const buttonEnabledColor = SerManosColors.grey75;
  static const buttonDisabledColor = SerManosColors.grey25;
  static const buttonActiveColor = SerManosColors.primary100;
  static const buttonErrorColor = SerManosColors.error;
  static const buttonOverlayColor = SerManosColors.grey10;
  static const textButtonOverlayColor = SerManosColors.grey25;
  static const textDisabledColor = SerManosColors.grey50;
  static const iconButtonActiveColor = SerManosColors.white;
  static const iconButtonDisabledColor = SerManosColors.grey50;

  //tab
  static const tabColor = SerManosColors.secondary100;
  static const tabSelectedColor = SerManosColors.secondary200;
  static const tabSelectedLineColor = SerManosColors.white;

  //card
  static const cardOverlineTextColor = SerManosColors.grey75;
  static const cardTitleColor = SerManosColors.black;
  static const cardTextColor = SerManosColors.grey75;

  //modal
  static const modalBackgroundColor = SerManosColors.white;
  static const modalHeadlineTextColor = SerManosColors.black;
  static const modalSubtitleTextColor = SerManosColors.black;
  static const modalBodyTextColor = SerManosColors.grey75;

  //vacancy
  static const vacancyEnabledColor = SerManosColors.secondary200;
  static const vacancyDisabledColor = SerManosColors.secondary80;
  static const vacancyColor = SerManosColors.grey75;

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
