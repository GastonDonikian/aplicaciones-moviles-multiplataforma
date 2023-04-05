import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {super.key,
      required this.placeholder,
      required this.label,
        required this.errorText,
      required this.errorIcon,
      required this.eraseIcon,
      required this.defaultIcon});

  final String placeholder;
  final String label;
  final String errorText;
  final IconData errorIcon;
  final IconData eraseIcon;
  final IconData defaultIcon;


  @override
  Widget build(BuildContext context) {
    InputDecoration defaultDecoration = InputDecoration(
        labelText: label,
        hintText: placeholder,
        helperText: errorText,
        suffixIcon: Icon(defaultIcon),
        enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: SerManosColorFoundations.defaultTextColor),
    ),
    );

    return TextFormField(
      decoration: defaultDecoration,
    );
  }

}
