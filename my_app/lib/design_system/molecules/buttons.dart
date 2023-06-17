import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosElevatedButton extends StatelessWidget {
  const SerManosElevatedButton(
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
  final void Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            disabled ? backgroundColorDisabled : backgroundColorActive,
        minimumSize: const Size.fromHeight(44),
      ),
      onPressed: disabled ? null : onPressed,
      child: SerManosTexts.button(
        label,
        color: disabled ? textColorDisabled : textColorActive,
      ),
    );
  }
}

class SerManosIconTextButton extends StatelessWidget {
  const SerManosIconTextButton(
      {super.key,
      required this.label,
      required this.buttonIcon,
      required this.onPressed,
      this.disabled = false,
      this.big = false});

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
  final void Function()? onPressed;
  final bool disabled;
  final bool big;

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
              disabled ? backgroundColorDisabled : backgroundColorActive,
          padding: big
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 14)
              : const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        onPressed: disabled ? null : onPressed);
  }
}

class SerManosButton extends StatelessWidget {
  const SerManosButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.disabled = false,
      this.big = false});

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
  final void Function()? onPressed;
  final bool disabled;
  final bool big;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            disabled ? backgroundColorDisabled : backgroundColorActive,
        padding: big
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 14)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      onPressed: disabled ? null : onPressed,
      child: SerManosTexts.button(
        label,
        color: disabled ? textColorDisabled : textColorActive,
      ),
    );
  }
}

class SerManosTextButton extends StatelessWidget {
  const SerManosTextButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.disabled = false,
      this.textColorActive = SerManosColorFoundations.buttonActiveColor});

  final Color textColorActive;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color overlayColor = SerManosColorFoundations.textButtonOverlayColor;
  final String label;
  final void Function()? onPressed;
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
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ));
  }
}

class SerManosFloatingActionButton extends StatelessWidget {
  const SerManosFloatingActionButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.disabled = false,
  });

  final IconData icon;
  final void Function()? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: SerManosShadows.boxShadows3,
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: SerManosColors.primary10,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: SerManosColorFoundations.buttonActiveColor),
      ),
    );
  }
}
