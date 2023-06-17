import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/forms.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/models/forms/login.dart';

import '../design_system/foundations/colors.dart';
import '../services/user_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isValid = false;
  LogInInfo logInInfo = LogInInfo();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userService = AuthenticationService();

  void onLoginPressed() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var email = logInInfo.email!;
      var password = logInInfo.password!;
      userService.signIn(email, password).then((value) {
        GoRouter.of(context).go('/home');
      }).catchError((e) {
        if (e is FirebaseAuthException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              backgroundColor: SerManosColorFoundations.buttonErrorColor,
            ),
          );
        }
      });
    } else {
      setState(() {
        isValid = false;
      });
    }
  }

  void onValidationChanged(bool isValid) {
    setState(() => this.isValid = isValid);
  }

  @override
  Widget build(BuildContext context) {
    return RegistrationLayout(
      body: _LoginBody(
        onValidationChanged: onValidationChanged,
        logInInfo: logInInfo,
        formKey: formKey,
      ),
      footer: _LoginFooter(loginEnabled: isValid, onLoginPressed: onLoginPressed),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({required this.onValidationChanged, required this.logInInfo, required this.formKey});

  final LogInInfo logInInfo;
  final GlobalKey<FormState> formKey;
  final Function(bool) onValidationChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        SerManosLogInForm(onValidationChanged: onValidationChanged, logInInfo: logInInfo, formKey: formKey)
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
        SerManosElevatedButton(label: 'Iniciar Sesión', disabled: !loginEnabled, onPressed: onLoginPressed),
        const SizedBox(height: 28),
        SerManosTextButton(label: "No tengo cuenta", onPressed: () => context.goNamed("signup")),
      ],
    );
  }
}
