import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/text_styles.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';
import 'package:my_app/utils/validation_rules.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../atoms/icons.dart';

//------------------ Generic Input ------------------//
class CustomGenericInput extends StatefulWidget {
  const CustomGenericInput({
    super.key,
    this.placeholder,
    required this.label,
    this.suffixIcon,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.helperText,
    this.inputFormatters,
    this.onSaved,
  });

  final String? placeholder;
  final String label;
  final Widget? suffixIcon;
  final Function(String?) validator;
  final TextEditingController controller;
  final bool obscureText;
  final String? helperText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onSaved;

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
      helperText: myFocusNode.hasFocus ? widget.helperText : null,
      helperStyle: const SerManosTextStyles.caption(color: SerManosColorFoundations.inputDefaultColor),
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
        borderSide: BorderSide(color: SerManosColorFoundations.inputDisabledColor, width: 1),
      ),
    );

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: myFocusNode,
      decoration: defaultDecoration,
      controller: widget.controller,
      cursorColor: !hasError ? SerManosColorFoundations.inputFocusColor : SerManosColorFoundations.inputErrorColor,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      onChanged: (value) => setState(() {
        hasError = widget.validator(value) != null;
      }),
      onSaved: widget.onSaved,
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
  const CustomTextInput({
    super.key,
    required this.placeholder,
    required this.label,
    required this.validator,
    required this.controller,
    required this.onSaved,
    this.inputFormatters,
  });

  final String? placeholder;
  final String label;
  final Function(String?) validator;
  final TextEditingController controller;
  final Function(String?) onSaved;
  final List<TextInputFormatter>? inputFormatters;

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
      onSaved: widget.onSaved,
      inputFormatters: widget.inputFormatters,
    );
  }
}
//------------------ END Text Input ------------------//

//------------------ Password Input ------------------//
class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({
    super.key,
    required this.placeholder,
    required this.label,
    required this.controller,
    required this.onSaved,
  });

  final String? placeholder;
  final String label;
  final TextEditingController controller;
  final Function(String?) onSaved;

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
      onSaved: widget.onSaved,
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
    this.onClear,
  });

  final String placeholder;
  final String label;
  final IconData eraseIcon;
  final IconData defaultIcon;
  final void Function(String)? onEnter;
  final void Function()? onClear;
  final void Function(String)? onChanged;

  @override
  State<CustomSearchInput> createState() => _CustomSearchInputState();
}

class _CustomSearchInputState extends State<CustomSearchInput> {
  TextEditingController controller = TextEditingController();

  void clear() {
    controller.clear();
    widget.onClear?.call();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration defaultDecoration = InputDecoration(
      hintText: widget.placeholder,
      suffixIcon: controller.text.isEmpty
          ? null
          : SerManosIconButton(
              icon: widget.eraseIcon,
              iconColor: SerManosColors.grey75,
              onPressed: clear,
            ),
      prefixIcon: Icon(widget.defaultIcon, color: SerManosColors.grey75),
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      hintStyle: const SerManosTextStyles.subtitle1(color: SerManosColors.grey75),
    );

    return Container(
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
            onChanged: (value) {
              setState(() {});
              widget.onChanged?.call(value);
            },
            onFieldSubmitted: widget.onEnter,
          ),
        ],
      ),
    );
  }
}
//------------------ END Search Input ------------------//

//------------------ Date Input ------------------//
class CustomDateInput extends StatefulWidget {
  const CustomDateInput({
    super.key,
    required this.placeholder,
    required this.label,
    required this.controller,
    required this.validator,
    required this.onSaved,
  });

  final String placeholder;
  final String label;
  final TextEditingController controller;
  final Function(String?) validator;
  final Function(String?) onSaved;

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  var maskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  DateTime firstDate = DateTime.now().subtract(const Duration(days: 365 * 100));
  DateTime lastDate = DateTime.now().subtract(const Duration(days: 365 * 16));

  @override
  Widget build(BuildContext context) {
    return CustomGenericInput(
      placeholder: widget.placeholder,
      label: widget.label,
      suffixIcon: SerManosIconButton(
        icon: SerManosIcons.calendarIcon,
        iconColor: SerManosColorFoundations.inputSufficIconColor,
        onPressed: () async {
          DateTime? date = await showDatePicker(
            context: context,
            initialDate: lastDate,
            firstDate: firstDate,
            lastDate: lastDate,
          );
          if (date != null) {
            var dateStr =
                '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
            widget.controller.text = dateStr;
          }
        },
      ),
      validator: (value) {
        var res = dateValidation(value);
        if (res == null) {
          return widget.validator(value);
        }
        return res;
      },
      controller: widget.controller,
      helperText: "Día / Mes / Año",
      inputFormatters: [maskFormatter],
      onSaved: widget.onSaved,
    );
  }
}
//------------------ END Date Input ------------------//

//------------------ Checkbox Input ------------------//
class SerManosCheckboxFormField extends FormField<String> {
  SerManosCheckboxFormField(
      {super.key,
      required List<String> options,
      required Function(bool) onChangeValidity,
      FormFieldSetter<String>? onSaved,
      FormFieldValidator<String>? validator,
      String? initialValue,
      AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
      bool autovalidate = true})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<String> state) {
              return Column(
                children: [
                  for (var option in options)
                    Row(
                      children: [
                        Checkbox(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            value: state.value == option,
                            fillColor: MaterialStateProperty.all(SerManosColors.primary100),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) {
                              var aux = state.isValid;
                              state.didChange(option);
                              if (aux != state.isValid) {
                                onChangeValidity(state.isValid);
                              }
                              if (state.isValid) {
                                state.save();
                              }
                            }),
                        SerManosTexts.body1(option, color: Colors.black),
                      ],
                    ),
                ],
              );
            });
}
//------------------ END Checkbox Input ------------------//
