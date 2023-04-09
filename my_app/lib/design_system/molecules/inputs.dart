import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/tokens/colors.dart';

import '../atoms/icons.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      required this.placeholder,
      required this.label,
        required this.errorText,
      required this.errorIcon,
      required this.eraseIcon,
      required this.defaultIcon}
      );

  final String placeholder;
  final String label;
  final String errorText;
  final IconData errorIcon;
  final IconData eraseIcon;
  final IconData defaultIcon;


  @override
  Widget build(BuildContext context) {
    bool hasError = false;
    InputDecoration defaultDecoration = InputDecoration(
        labelText: label,
        hintText: placeholder,
        suffixIcon: hasError ? const Icon(SerManosIcons.errorIcon) : const Icon(SerManosIcons.closeIcon),
        errorText: hasError? errorText: null,
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: SerManosColorFoundations.defaultTextColor)),
        errorBorder: hasError ? const OutlineInputBorder(
          borderSide: BorderSide(color: SerManosColorFoundations.buttonErrorColor)) : null,
    );

    return TextFormField(
      enabled: false,
      decoration: defaultDecoration,
    );
  }

}
