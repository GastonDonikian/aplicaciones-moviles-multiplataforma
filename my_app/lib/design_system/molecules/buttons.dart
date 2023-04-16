import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';

class SerManosElevatedButton extends StatelessWidget {
  SerManosElevatedButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.disabled = false});

  final Color textColorActive = SerManosColorFoundations.defaultTextColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color backgroundColorActive =
      SerManosColorFoundations.buttonActiveColor;
  final Color backgroundColorDisabled =
      SerManosColorFoundations.buttonDisabledColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final String label;
  void Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor:
              disabled ? backgroundColorDisabled : backgroundColorActive),
      // style: ButtonStyle(
      //   foregroundColor: MaterialStateProperty.resolveWith<Color?>(
      //     (Set<MaterialState> states) {
      //       if (states.contains(MaterialState.disabled)) {
      //         return textColorDisabled;
      //       } else {
      //         return textColorActive;
      //       }
      //     },
      //   ),
      //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      //     (Set<MaterialState> states) {
      //       if (states.contains(MaterialState.disabled)) {
      //         return SerManosColorFoundations.getMaterialColor(
      //             backgroundColorDisabled);
      //       } else {
      //         return SerManosColorFoundations.getMaterialColor(
      //             backgroundColorActive);
      //       }
      //     },
      //   ),
      //   overlayColor: MaterialStateProperty.resolveWith<Color?>(
      //     (Set<MaterialState> states) {
      //       if (states.contains(MaterialState.hovered)) {
      //         return SerManosColorFoundations.getMaterialColor(overlayColor)
      //             .withOpacity(0.04);
      //       }
      //       if (states.contains(MaterialState.focused) ||
      //           states.contains(MaterialState.pressed)) {
      //         return SerManosColorFoundations.getMaterialColor(overlayColor)
      //             .withOpacity(0.12);
      //       }
      //       return null; // Defer to the widget's default.
      //     },
      //   ),
      // ),
      onPressed: disabled ? null : onPressed,
      child: SerManosTexts.button(
        label,
        color: disabled ? textColorDisabled : textColorActive,
      ),
    );
  }
}

class SerManosIconTextButton extends StatelessWidget {
  SerManosIconTextButton(
      {super.key,
      required this.label,
      required this.buttonIcon,
      required this.onPressed,
      this.disabled = false});

  final Color textColorActive = SerManosColorFoundations.defaultTextColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color backgroundColorActive =
      SerManosColorFoundations.buttonActiveColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final Color backgroundColorDisabled =
      SerManosColorFoundations.buttonDisabledColor;
  final Color iconButtonActiveColor =
      SerManosColorFoundations.iconButtonActiveColor;
  final Color iconButtonDisabledColor =
      SerManosColorFoundations.iconButtonDisabledColor;
  final String label;
  final IconData buttonIcon;
  void Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(
          buttonIcon,
          color: disabled ? iconButtonDisabledColor : iconButtonActiveColor,
        ),
        label: SerManosTexts.button(
          label,
          color: disabled ? textColorDisabled : textColorActive,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor:
                disabled ? backgroundColorDisabled : backgroundColorActive),
        // style: ButtonStyle(
        // backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        //     (Set<MaterialState> states) {
        //   if (states.contains(MaterialState.disabled)) {
        //     return SerManosColorFoundations.getMaterialColor(
        //         backgroundColorDisabled);
        //   } else {
        //     return SerManosColorFoundations.getMaterialColor(
        //         backgroundColorActive);
        //   }
        // }),
        // overlayColor: MaterialStateProperty.resolveWith<Color?>(
        //   (Set<MaterialState> states) {
        //     if (states.contains(MaterialState.hovered)) {
        //       return SerManosColorFoundations.getMaterialColor(overlayColor)
        //           .withOpacity(0.04);
        //     }
        //     if (states.contains(MaterialState.focused) ||
        //         states.contains(MaterialState.pressed)) {
        //       return SerManosColorFoundations.getMaterialColor(overlayColor)
        //           .withOpacity(0.12);
        //     }
        //     return null; // Defer to the widget's default.
        //   },
        // ),
        // ),
        onPressed: disabled ? null : onPressed);
  }
}

class SerManosTextButton extends StatelessWidget {
  SerManosTextButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.disabled = false});

  final Color textColorActive = SerManosColorFoundations.buttonActiveColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color overlayColor = SerManosColorFoundations.textButtonOverlayColor;
  final String label;
  void Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
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
      onPressed: disabled ? null : onPressed,
      child: SerManosTexts.button(
        label,
        color: disabled ? textColorDisabled : textColorActive,
      ),
    );
  }
}

class SerManosIconButton extends StatelessWidget {
  SerManosIconButton(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.onPressed});

  final IconData icon;
  final Color iconColor;
  void Function()? onPressed;
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ));
  }
}
