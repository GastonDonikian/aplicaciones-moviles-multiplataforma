import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class _LoadingButton extends StatelessWidget {
  const _LoadingButton({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}

class SerManosElevatedButton extends StatelessWidget {
  const SerManosElevatedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.loading = false,
  });

  final Color textColorActive = SerManosColorFoundations.defaultTextColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color backgroundColorActive = SerManosColorFoundations.buttonActiveColor;
  final Color backgroundColorDisabled = SerManosColorFoundations.buttonDisabledColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final String label;
  final void Function()? onPressed;
  final bool disabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = disabled || loading ? backgroundColorDisabled : backgroundColorActive;
    Color textColor = disabled || loading ? textColorDisabled : textColorActive;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(44),
      ),
      onPressed: disabled || loading ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) _LoadingButton(color: textColor),
          SerManosTexts.button(
            label,
            color: textColor,
          ),
        ],
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
      this.loading = false,
      this.big = false});

  final Color textColorActive = SerManosColorFoundations.defaultTextColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color backgroundColorActive = SerManosColorFoundations.buttonActiveColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final Color backgroundColorDisabled = SerManosColorFoundations.buttonDisabledColor;
  final Color iconButtonActiveColor = SerManosColorFoundations.iconButtonActiveColor;
  final Color iconButtonDisabledColor = SerManosColorFoundations.iconButtonDisabledColor;
  final String label;
  final IconData buttonIcon;
  final void Function()? onPressed;
  final bool disabled;
  final bool big;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Color iconColor = disabled || loading ? iconButtonDisabledColor : iconButtonActiveColor;

    return ElevatedButton.icon(
        icon: loading
            ? _LoadingButton(color: iconColor)
            : Icon(
                buttonIcon,
                color: iconColor,
              ),
        label: SerManosTexts.button(
          label,
          color: disabled || loading ? textColorDisabled : textColorActive,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: disabled || loading ? backgroundColorDisabled : backgroundColorActive,
          padding: big
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 14)
              : const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        ),
        onPressed: disabled || loading ? null : onPressed);
  }
}

class SerManosButton extends StatelessWidget {
  const SerManosButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.disabled = false,
    this.big = false,
    this.loading = false,
  });

  final Color textColorActive = SerManosColorFoundations.defaultTextColor;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color backgroundColorActive = SerManosColorFoundations.buttonActiveColor;
  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final Color backgroundColorDisabled = SerManosColorFoundations.buttonDisabledColor;
  final Color iconButtonActiveColor = SerManosColorFoundations.iconButtonActiveColor;
  final Color iconButtonDisabledColor = SerManosColorFoundations.iconButtonDisabledColor;
  final String label;
  final void Function()? onPressed;
  final bool disabled;
  final bool big;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Color textColor = disabled || loading ? textColorDisabled : textColorActive;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: disabled || loading ? backgroundColorDisabled : backgroundColorActive,
        padding: big
            ? const EdgeInsets.symmetric(horizontal: 12, vertical: 14)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      onPressed: disabled || loading ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) _LoadingButton(color: textColor),
          SerManosTexts.button(
            label,
            color: textColor,
          ),
        ],
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
      this.loading = false,
      this.textColorActive = SerManosColorFoundations.buttonActiveColor});

  final Color textColorActive;
  final Color textColorDisabled = SerManosColorFoundations.textDisabledColor;
  final Color overlayColor = SerManosColorFoundations.textButtonOverlayColor;
  final String label;
  final void Function()? onPressed;
  final bool disabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Color textColor = disabled || loading ? textColorDisabled : textColorActive;

    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return SerManosColorFoundations.getMaterialColor(overlayColor).withOpacity(0.04);
            }
            if (states.contains(MaterialState.focused) || states.contains(MaterialState.pressed)) {
              return SerManosColorFoundations.getMaterialColor(overlayColor).withOpacity(0.12);
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      onPressed: disabled || loading ? null : onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loading) _LoadingButton(color: textColor),
          SerManosTexts.button(
            label,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class SerManosIconButton extends StatelessWidget {
  SerManosIconButton({super.key, required this.icon, required this.iconColor, required this.onPressed});

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
