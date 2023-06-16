import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/text_styles.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';
import 'package:my_app/utils/validation_rules.dart';

import '../atoms/icons.dart';

//------------------ Generic Input ------------------//
class CustomGenericInput extends StatefulWidget {
  const CustomGenericInput(
      {super.key,
      required this.placeholder,
      required this.label,
      required this.suffixIcon,
      required this.validator,
      required this.controller,
      this.obscureText = false});

  final String? placeholder;
  final String label;
  final Widget? suffixIcon;
  final Function(String?) validator;
  final TextEditingController controller;
  final bool obscureText;

  @override
  State<CustomGenericInput> createState() => _CustomGenericInputState();
}

class _CustomGenericInputState extends State<CustomGenericInput> {
  FocusNode myFocusNode = FocusNode();
  bool hasError = false;

  @override
  void initState() {
    myFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InputBorder? errorBorder = hasError
        ? const OutlineInputBorder(borderSide: BorderSide(color: SerManosColorFoundations.inputErrorColor, width: 1))
        : null;

    InputDecoration defaultDecoration = InputDecoration(
      labelText: widget.label,
      hintText: widget.placeholder,
      suffixIcon: buildSuffixIcon(hasError),
      border:
          const OutlineInputBorder(borderSide: BorderSide(color: SerManosColorFoundations.inputDefaultColor, width: 1)),
      errorBorder: errorBorder,
      focusColor: SerManosColorFoundations.inputFocusColor,
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: SerManosColorFoundations.inputFocusColor, width: 1)),
      labelStyle: SerManosTextStyles.subtitle1(color: labelColor(hasError)),
      floatingLabelBehavior: widget.placeholder != null ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
      disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: SerManosColorFoundations.inputDisabledColor, width: 1)),
    );

    return TextFormField(
      focusNode: myFocusNode,
      decoration: defaultDecoration,
      controller: widget.controller,
      cursorColor: !hasError ? SerManosColorFoundations.inputFocusColor : SerManosColorFoundations.inputErrorColor,
      obscureText: widget.obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: (value) => setState(() {
        hasError = widget.validator(value) != null;
      }),
      validator: (value) => widget.validator(value),
    );
  }

  Widget? buildSuffixIcon(bool hasError) {
    if (hasError) {
      return const Icon(SerManosIcons.errorIcon, color: SerManosColorFoundations.inputErrorColor);
    } else {
      return widget.suffixIcon;
    }
  }

  Color labelColor(bool hasError) {
    if (hasError) {
      return SerManosColorFoundations.inputErrorColor;
    } else if (myFocusNode.hasFocus) {
      return SerManosColorFoundations.inputFocusColor;
    } else {
      return SerManosColorFoundations.inputDefaultColor;
    }
  }
}

//------------------ Text Input ------------------//
class CustomTextInput extends StatefulWidget {
  const CustomTextInput(
      {super.key, required this.placeholder, required this.label, required this.validator, required this.controller});

  final String? placeholder;
  final String label;
  final Function(String?) validator;
  final TextEditingController controller;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomGenericInput(
      placeholder: widget.placeholder,
      label: widget.label,
      suffixIcon: null,
      validator: widget.validator,
      controller: widget.controller,
    );
  }
}
//------------------ END Text Input ------------------//

//------------------ Password Input ------------------//
class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({super.key, required this.placeholder, required this.label, required this.controller});

  final String? placeholder;
  final String label;
  final TextEditingController controller;

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomGenericInput(
      placeholder: widget.placeholder,
      label: widget.label,
      suffixIcon: SerManosIconButton(
        icon: isPasswordVisible ? SerManosIcons.visibilityIconSharp : SerManosIcons.visibilityOffIcon,
        iconColor: SerManosColorFoundations.inputDefaultColor,
        onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo requerido";
        } else if (!isValidPassword(value)) {
          return "La contraseña debe tener al menos 6 caracteres";
        }
        return null;
      },
      controller: widget.controller,
      obscureText: !isPasswordVisible,
    );
  }
}
//------------------ END Password Input ------------------//

//------------------ Search Input ------------------//
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
//------------------ END Search Input ------------------//
