import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class CtaTextButton extends StatelessWidget {
  CtaTextButton({super.key, required this.label, required this.onPressed});

  final Color textColorActive = SerManosColorFoundations.buttonActiveColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color overlayColor = SerManosColorFoundations.textButtonOverlayColor;
  final String label;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return textColorDisabled;
              } else {
                return textColorActive;
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
