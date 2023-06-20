import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/forms.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/models/forms/signup.dart';
import 'package:my_app/providers/user_provider.dart';

import '../services/user_service.dart';
import '../utils/error_utils.dart';

class SignUpPage extends ConsumerStatefulWidget {
  SignUpPage({super.key, this.authService});

  static String get routeName => 'signup';
  static String get routeLocation => '/signup';
  AuthenticationService? authService;
  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  bool isValid = false;
  bool loading = false;
  SignUpInfo signUpInfo = SignUpInfo();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var userService;


  @override
  void initState() {
    super.initState();
    if(widget.authService == null) {
      userService = AuthenticationService();
    }
    else {
      userService = widget.authService;
    }
  }

  void onSignUpPressed() {
    setState(() {
      loading = true;
    });
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var name = signUpInfo.firstName!;
      var surname = signUpInfo.lastName!;
      var email = signUpInfo.email!;
      var password = signUpInfo.password!;

      userService.signUp(name, surname, email, password).then((value) {
        userService.getUserById(value.user!.uid).then((user) {
          if (user == null) {
            throw FirebaseAuthException(
                code: 'user-not-found', message: 'User not found');
          } else {
            ref.read(userProvider.notifier).setUser(user);
            context.goNamed('welcome');
            setState(() {
              loading = false;
            });
          }
        });
      }).catchError((e) {
        if (e is FirebaseAuthException) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(ErrorUtils.translateErrorMessage(e.code.toString())),
            backgroundColor: SerManosColorFoundations.buttonErrorColor,
          ));
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
        body: _SignUpBody(
          onValidationChanged: onValidationChanged,
          signUpInfo: signUpInfo,
          formKey: formKey,
        ),
        footer: _SignUpFooter(
            signUpEnabled: isValid,
            onSignUpPressed: onSignUpPressed,
            isLoading: loading));
  }
}

class _SignUpBody extends StatelessWidget {
  const _SignUpBody({
    Key? key,
    required this.onValidationChanged,
    required this.signUpInfo,
    required this.formKey,
  }) : super(key: key);

  final Function(bool) onValidationChanged;
  final SignUpInfo signUpInfo;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        SerManosSignUpForm(
          onValidationChanged: onValidationChanged,
          signUpInfo: signUpInfo,
          formKey: formKey,
        ),
      ],
    );
  }
}

class _SignUpFooter extends StatelessWidget {
  const _SignUpFooter(
      {Key? key,
      required this.signUpEnabled,
      this.isLoading = false,
      required this.onSignUpPressed});

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
          loading: isLoading,
        ),
        const SizedBox(height: 28),
        SerManosTextButton(
            label: "Ya tengo cuenta",
            onPressed: () => context.goNamed("login")),
        const SizedBox(height: 44),
      ],
    );
  }
}
