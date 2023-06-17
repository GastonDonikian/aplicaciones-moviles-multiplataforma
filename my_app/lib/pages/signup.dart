import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/inputs.dart';
import 'package:my_app/utils/validation_rules.dart';

import '../services/user_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isValid = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  final userService = AuthenticationService();

  void onSignUpPressed() {
    if (formKey.currentState!.validate()) {
      var name = nameController.text;
      var surname = lastNameController.text;
      var email = emailController.text;
      var password = passwordController.text;

      userService.signUp(name, surname, email, password).then((value) {
        GoRouter.of(context).go('/home');
      }).catchError((e) {
        if (e is FirebaseAuthException) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(e.message.toString()),
            backgroundColor: SerManosColorFoundations.buttonErrorColor,
          ));
        }
      });
    }
    else {
      setState(() {
        isValid = false;
      });
    }
  }

  void validateForm() {
    setState(() {
      isValid = emailValidation(emailController.text) == null &&
          passwordValidation(passwordController.text) == null &&
          textValidation(nameController.text, 'nombre') == null &&
          textValidation(lastNameController.text, 'apellido') == null;
    });
  }

  @override
  void initState() {
    validateForm();
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
    return RegistrationLayout(
        body: _SignUpBody(
            emailController: emailController,
            formKey: formKey,
            lastNameController: lastNameController,
            nameController: nameController,
            passwordController: passwordController),
        footer: _SignUpFooter(signUpEnabled: isValid, onSignUpPressed: onSignUpPressed));
  }
}

class _SignUpBody extends StatelessWidget {
  const _SignUpBody({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.lastNameController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextInput(
                label: "Nombre",
                placeholder: "Ej: Juan",
                controller: nameController,
                validator: (value) => textValidation(value, 'nombre'),
              ),
              const SizedBox(height: 24),
              CustomTextInput(
                label: "Apellido",
                placeholder: "Ej: Barcena",
                controller: lastNameController,
                validator: (value) => textValidation(value, 'apellido'),
              ),
              const SizedBox(height: 24),
              CustomTextInput(
                label: "Email",
                placeholder: "Ej: juanbarcena@mail.com",
                controller: emailController,
                validator: emailValidation,
              ),
              const SizedBox(height: 24),
              CustomPasswordInput(
                label: "Contraseña",
                placeholder: "Ej: ABCD1234",
                controller: passwordController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SignUpFooter extends StatelessWidget {
  const _SignUpFooter({Key? key, required this.signUpEnabled, this.isLoading = false, required this.onSignUpPressed});

  final bool signUpEnabled;
  final bool isLoading;
  final Function() onSignUpPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SerManosElevatedButton(
          label: 'Registrarse',
          disabled: !signUpEnabled,
          onPressed: onSignUpPressed,
        ),
        const SizedBox(height: 28),
        SerManosTextButton(label: "Ya tengo cuenta", onPressed: () => context.goNamed("login")),
      ],
    );
  }
}
