import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class ButtonElevatedShort extends StatelessWidget {
  const ButtonElevatedShort({super.key, required this.text});

  final Color foregroundColor = SerManosColorFoundations.buttonActiveColor;
  final Color overlayColor = SerManosColorFoundations.buttonEnabledColor;
  final Color disabledColor = SerManosColorFoundations.buttonDisabledColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
              SerManosColorFoundations.getMaterialColor(foregroundColor)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return SerManosColorFoundations.getMaterialColor(overlayColor)
                    .withOpacity(0.04);
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return SerManosColorFoundations.getMaterialColor(overlayColor)
                    .withOpacity(0.12);
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: () {},
        child: Text(text));
  }
}
