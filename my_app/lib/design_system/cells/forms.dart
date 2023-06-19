import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/inputs.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/models/forms/contact.dart';
import 'package:my_app/models/forms/login.dart';
import 'package:my_app/models/forms/signup.dart';
import 'package:my_app/models/gender.dart';
import 'package:my_app/models/forms/personal_info.dart';
import 'package:my_app/utils/validation_rules.dart';

class SerManosLogInForm extends StatefulWidget {
  const SerManosLogInForm({
    Key? key,
    required this.onValidationChanged,
    required this.logInInfo,
    required this.formKey,
  }) : super(key: key);

  final Function(bool) onValidationChanged;
  final LogInInfo logInInfo;
  final GlobalKey<FormState> formKey;

  @override
  State<SerManosLogInForm> createState() => _SerManosLogInFormState();
}

class _SerManosLogInFormState extends State<SerManosLogInForm> {
  bool isValid = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void validateForm() {
    var aux = isValid;
    setState(() {
      isValid = emailValidation(emailController.text) == null && passwordValidation(passwordController.text) == null;
    });
    if (isValid != aux) {
      widget.onValidationChanged(isValid);
    }
  }

  @override
  void initState() {
    emailController.addListener(() {
      validateForm();
    });
    passwordController.addListener(() {
      validateForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextInput(
            label: "Email",
            placeholder: null,
            controller: emailController,
            validator: emailValidation,
            onSaved: (email) {
              widget.logInInfo.email = email!;
            },
          ),
          const SizedBox(height: 24),
          CustomPasswordInput(
            label: "Contraseña",
            placeholder: null,
            controller: passwordController,
            onSaved: (password) {
              widget.logInInfo.password = password!;
            },
          ),
        ],
      ),
    );
  }
}

class SerManosSignUpForm extends StatefulWidget {
  const SerManosSignUpForm({
    Key? key,
    required this.onValidationChanged,
    required this.signUpInfo,
    required this.formKey,
  }) : super(key: key);

  final Function(bool) onValidationChanged;
  final SignUpInfo signUpInfo;
  final GlobalKey<FormState> formKey;

  @override
  State<SerManosSignUpForm> createState() => _SerManosSignUpFormState();
}

class _SerManosSignUpFormState extends State<SerManosSignUpForm> {
  bool isValid = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  void validateForm() {
    var aux = isValid;
    setState(() {
      isValid = emailValidation(emailController.text) == null &&
          passwordValidation(passwordController.text) == null &&
          textValidation(nameController.text, 'nombre') == null &&
          textValidation(lastNameController.text, 'apellido') == null;
    });
    if (isValid != aux) {
      widget.onValidationChanged(isValid);
    }
  }

  @override
  void initState() {
    emailController.addListener(() {
      validateForm();
    });
    passwordController.addListener(() {
      validateForm();
    });
    nameController.addListener(() {
      validateForm();
    });
    lastNameController.addListener(() {
      validateForm();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextInput(
            label: "Nombre",
            placeholder: "Ej: Juan",
            controller: nameController,
            validator: (value) => textValidation(value, 'nombre'),
            onSaved: (firstName) {
              widget.signUpInfo.firstName = firstName!;
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            label: "Apellido",
            placeholder: "Ej: Barcena",
            controller: lastNameController,
            validator: (value) => textValidation(value, 'apellido'),
            onSaved: (lastName) {
              widget.signUpInfo.lastName = lastName!;
            },
          ),
          const SizedBox(height: 24),
          CustomTextInput(
            label: "Email",
            placeholder: "Ej: juanbarcena@mail.com",
            controller: emailController,
            validator: emailValidation,
            onSaved: (email) {
              widget.signUpInfo.email = email!;
            },
          ),
          const SizedBox(height: 24),
          CustomPasswordInput(
            label: "Contraseña",
            placeholder: "Ej: ABCD1234",
            controller: passwordController,
            onSaved: (password) {
              widget.signUpInfo.password = password!;
            },
          ),
        ],
      ),
    );
  }
}

class SerManosPersonalInfoForm extends StatefulWidget {
  // TODO: missing photo input
  const SerManosPersonalInfoForm({
    Key? key,
    required this.personalInfo,
    required this.onValidationChanged,
    required this.formKey,
  }) : super(key: key);

  final PersonalInfo personalInfo;
  final Function(bool) onValidationChanged;
  final GlobalKey<FormState> formKey;

  @override
  State<SerManosPersonalInfoForm> createState() => _SerManosPersonalInfoFormState();
}

class _SerManosPersonalInfoFormState extends State<SerManosPersonalInfoForm> {
  String? gender;
  bool isValid = false;
  bool isCheckBoxValid = false;
  late TextEditingController dateController;

  void setGender(String string) {
    widget.personalInfo.gender = parseGender(string);
  }

  void validateForm() {
    var aux = isValid;
    setState(() {
      isValid = dateValidation(dateController.text) == null && isCheckBoxValid;
    });
    if (isValid != aux) {
      widget.onValidationChanged(isValid);
    }
  }

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(text: widget.personalInfo.birthDate);
    isCheckBoxValid = widget.personalInfo.gender == null ? false : true;
    dateController.addListener(() {
      validateForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SerManosTexts.headline1("Datos de perfil", color: SerManosColors.black),
          const SizedBox(height: 16),
          Form(
            key: widget.formKey,
            child: Column(children: [
              CustomDateInput(
                placeholder: "DD/MM/YYYY",
                label: "Fecha de nacimiento",
                controller: dateController,
                validator: (value) => null,
                onSaved: (date) {
                  widget.personalInfo.birthDate = date!;
                },
              ),
              const SizedBox(height: 24),
              SerManosInputCard(
                initialValue: widget.personalInfo.gender == null ? null : widget.personalInfo.gender!.value,
                cardTitle: "Información de perfil",
                options: [Gender.man.value, Gender.woman.value, Gender.nonBinary.value],
                onSaved: (value) {
                  setGender(value!);
                },
                onChangedValidity: (value) {
                  setState(() => isCheckBoxValid = value);
                  validateForm();
                },
              ),
              const SizedBox(height: 24),
              SerManosPhotoInputCard(image: null),
            ]),
          )
        ],
      ),
    );
  }
}

class SerManosContactForm extends StatefulWidget {
  const SerManosContactForm({
    Key? key,
    required this.contactInfo,
    required this.onValidationChanged,
    required this.formKey,
  }) : super(key: key);

  final ContactInfo contactInfo;
  final GlobalKey<FormState> formKey;
  final Function(bool) onValidationChanged;

  @override
  State<SerManosContactForm> createState() => _SerManosContactFormState();
}

class _SerManosContactFormState extends State<SerManosContactForm> {
  bool isValid = false;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;

  void validateForm() {
    var aux = isValid;
    setState(() {
      isValid =
          phoneNumberValidation(phoneNumberController.text) == null && emailValidation(emailController.text) == null;
    });
    if (isValid != aux) {
      widget.onValidationChanged(isValid);
    }
  }

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController(text: widget.contactInfo.phoneNumber);
    emailController = TextEditingController(text: widget.contactInfo.email);
    phoneNumberController.addListener(() {
      validateForm();
    });
    emailController.addListener(() {
      validateForm();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SerManosTexts.headline1("Datos de contacto", color: SerManosColors.black),
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 24, bottom: 24),
            child: SerManosTexts.subtitle1(
              "Estos datos serán compartidos con la organización para ponerse en contacto contigo",
              color: SerManosColors.black,
            ),
          ),
          Form(
            key: widget.formKey,
            child: Column(children: [
              CustomTextInput(
                placeholder: "Ej: +541178445459",
                label: "Teléfono",
                validator: phoneNumberValidation,
                controller: phoneNumberController,
                onSaved: (phoneNumber) {
                  widget.contactInfo.phoneNumber = phoneNumber;
                },
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\+0-9]')),
                ],
              ),
              const SizedBox(height: 24),
              CustomTextInput(
                placeholder: "Ej: mimail@mail.com",
                label: "Mail",
                validator: emailValidation,
                controller: emailController,
                onSaved: (email) {
                  widget.contactInfo.email = email;
                },
              ),
            ]),
          )
        ],
      ),
    );
  }
}
