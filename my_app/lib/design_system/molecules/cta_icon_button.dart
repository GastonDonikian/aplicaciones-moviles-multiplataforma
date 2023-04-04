import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class CtaIconButton extends StatelessWidget {
  CtaIconButton(
      {super.key,
      required this.label,
      required this.buttonIcons,
      required this.onPressed});

  final Color backgroundColorActive =
      SerManosColorFoundations.buttonActiveColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final Color backgroundColorDisabled =
      SerManosColorFoundations.buttonDisabledColor;
  final String label;
  final Map<String, Icon> buttonIcons;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(buttonIcons['active']!.icon),
        label: Text(label),
        style: ButtonStyle(
          iconColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return SerManosColorFoundations.getMaterialColor(
                    SerManosColors.grey50);
              }
              return SerManosColorFoundations.getMaterialColor(
                  SerManosColors.white);
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return SerManosColorFoundations.getMaterialColor(
                  backgroundColorDisabled);
            } else {
              return SerManosColorFoundations.getMaterialColor(
                  backgroundColorActive);
            }
          }),
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
        onPressed: () {
          onPressed!();
        });
  }
}
