import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class Input extends StatelessWidget {
  Input(
      {super.key,
      required this.placeholder,
      required this.label,
      required this.errorIcon,
      required this.eraseIcon,
      required this.defaultIcon});

  final String placeholder;
  final String label;
  final IconData errorIcon;
  final IconData eraseIcon;
  final IconData defaultIcon;
  
  @override
  Widget build(BuildContext context) {
    return 
  }
}
