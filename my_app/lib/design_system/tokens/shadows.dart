import 'package:flutter/material.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class SerManosShadows {
  static const List<BoxShadow> boxShadows1 = [
    BoxShadow(
      color: SerManosColors.blackOpacity15,
      offset: Offset(0, 1),
      blurRadius: 3,
      spreadRadius: 1,
    ),
    BoxShadow(
      color: SerManosColors.blackOpacity30,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
  ];
  static const List<BoxShadow> boxShadows2 = [
    BoxShadow(
      color: SerManosColors.blackOpacity15,
      offset: Offset(0, 1),
      blurRadius: 2,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: SerManosColors.blackOpacity30,
      offset: Offset(0, 2),
      blurRadius: 6,
      spreadRadius: 2,
    ),
  ];
  static const List<BoxShadow> boxShadows3 = [
    BoxShadow(
      color: SerManosColors.blackOpacity15,
      offset: Offset(0, 4),
      blurRadius: 4,
      spreadRadius: 0,
    ),
    BoxShadow(
      color: SerManosColors.blackOpacity30,
      offset: Offset(0, 8),
      blurRadius: 12,
      spreadRadius: 6,
    ),
  ];
}
