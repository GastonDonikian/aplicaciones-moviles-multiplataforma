import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/inputs.dart';
import 'package:my_app/utils/validation_rules.dart';

import '../services/user_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isValid = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final userService = AuthenticationService();


  void onLoginPressed() {
    if (formKey.currentState!.validate()) {
      var email = emailController.text;
      var password = passwordController.text;
      userService.signIn(email, password).then((value) => GoRouter.of(context).go('/home'));
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  void validateForm() {
    setState(() {
      isValid = emailValidation(emailController.text) == null && passwordValidation(passwordController.text) == null;
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationLayout(
        body: _LoginBody(formKey: formKey, emailController: emailController, passwordController: passwordController),
        footer: _LoginFooter(
          loginEnabled: isValid,
          onLoginPressed: onLoginPressed,
        ));
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({required this.formKey, required this.emailController, required this.passwordController});

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

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
                label: "Email",
                placeholder: null,
                controller: emailController,
                validator: emailValidation,
              ),
              const SizedBox(height: 24),
              CustomPasswordInput(
                label: "Contraseña",
                placeholder: null,
                controller: passwordController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LoginFooter extends StatelessWidget {
  const _LoginFooter({Key? key, required this.loginEnabled, this.loginInProgress = false, required this.onLoginPressed})
      : super(key: key);

  final bool loginEnabled;
  final bool loginInProgress;
  final Function() onLoginPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SerManosElevatedButton(
          label: 'Iniciar Sesión',
          disabled: !loginEnabled,
          onPressed: onLoginPressed,
        ),
        const SizedBox(height: 28),
        SerManosTextButton(label: "No tengo cuenta", onPressed: () => context.goNamed("signup")),
      ],
    );
  }
}
