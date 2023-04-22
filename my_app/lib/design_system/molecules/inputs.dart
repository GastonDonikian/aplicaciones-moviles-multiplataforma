import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/text_styles.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

import '../atoms/icons.dart';

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
    bool hasError = false;
    InputDecoration defaultDecoration = InputDecoration(
      labelText: label,
      hintText: placeholder,
      suffixIcon: hasError ? const Icon(SerManosIcons.errorIcon) : const Icon(SerManosIcons.closeIcon),
      errorText: hasError ? errorText : null,
      border: const OutlineInputBorder(borderSide: BorderSide(color: SerManosColorFoundations.defaultTextColor)),
      errorBorder: hasError
          ? const OutlineInputBorder(borderSide: BorderSide(color: SerManosColorFoundations.buttonErrorColor))
          : null,
    );

    return TextFormField(
      enabled: false,
      decoration: defaultDecoration,
    );
  }
}

class CustomSearchInput extends StatefulWidget {
  const CustomSearchInput({
    super.key,
    required this.placeholder,
    required this.label,
    required this.eraseIcon,
    required this.defaultIcon,
    this.onEnter,
    this.onChanged,
  });

  final String placeholder;
  final String label;
  final IconData eraseIcon;
  final IconData defaultIcon;
  final void Function(String)? onEnter;
  final void Function(String)? onChanged;

  @override
  State<CustomSearchInput> createState() => _CustomSearchInputState();
}

class _CustomSearchInputState extends State<CustomSearchInput> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  void clear() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration defaultDecoration = InputDecoration(
      hintText: widget.placeholder,
      suffixIcon: controller.text.isEmpty
          ? Icon(widget.defaultIcon, color: SerManosColors.grey75)
          : IconButton(
              icon: Icon(widget.eraseIcon),
              color: SerManosColors.grey75,
              onPressed: clear,
            ),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.only(top: 14, bottom: 12),
      hintStyle: const SerManosTextStyles.subtitle1(color: SerManosColors.grey75),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: SerManosColors.white,
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        boxShadow: SerManosShadows.boxShadows1,
      ),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: defaultDecoration,
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onEnter,
          ),
        ],
      ),
    );
  }
}
