import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/forms.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/models/forms/login.dart';
import 'package:my_app/providers/user_provider.dart';

import '../design_system/foundations/colors.dart';
import '../services/user_service.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static String get routeName => 'login';
  static String get routeLocation => '/login';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool isValid = false;
  LogInInfo logInInfo = LogInInfo();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final userService = AuthenticationService();
  bool loading = false;

  void onLoginPressed() {
    setState(() {
      loading = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var email = logInInfo.email!;
      var password = logInInfo.password!;
      userService.signIn(email, password).then((value) {
        userService.getUserById(value.user!.uid).then((user) {
          if (user == null) {
            throw FirebaseAuthException(code: 'user-not-found', message: 'User not found');
          } else {
            ref.read(userProvider.notifier).setUser(user);
            context.goNamed('home');
            setState(() {
              loading = false;
            });
          }
        });
      }).catchError((e) {
        if (e is FirebaseAuthException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              backgroundColor: SerManosColorFoundations.buttonErrorColor,
            ),
          );
        }
        setState(() {
          loading = false;
        });
      });
    } else {
      setState(() {
        isValid = false;
        loading = false;
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
      footer: _LoginFooter(loginEnabled: isValid, onLoginPressed: onLoginPressed, loginInProgress: loading),
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
        SerManosElevatedButton(
          label: 'Iniciar Sesión',
          disabled: !loginEnabled,
          onPressed: onLoginPressed,
          loading: loginInProgress,
        ),
        const SizedBox(height: 28),
        SerManosTextButton(label: "No tengo cuenta", onPressed: () => context.goNamed("signup")),
      ],
    );
  }
}
