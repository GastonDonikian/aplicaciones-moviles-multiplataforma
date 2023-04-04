import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class CtaElevatedButton extends StatelessWidget {
  CtaElevatedButton({super.key, required this.label, required this.onPressed});

  final Color backgroundColorActive =
      SerManosColorFoundations.buttonActiveColor;
  final Color backgroundColorDisabled =
      SerManosColorFoundations.buttonDisabledColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final String label;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return SerManosColorFoundations.getMaterialColor(
                    backgroundColorDisabled);
              } else {
                return SerManosColorFoundations.getMaterialColor(
                    backgroundColorActive);
              }
            },
          ),
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
        child: Text(label),
        onPressed: () {
          onPressed!();
        });
  }
}
