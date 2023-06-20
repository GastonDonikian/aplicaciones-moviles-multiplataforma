import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static String get routeName => 'landing';
  static String get routeLocation => '/landing';

  @override
  Widget build(BuildContext context) {
    return const RegistrationLayout(
        body: _LandingBody(), footer: _LandingFooter());
  }
}

class _LandingBody extends StatelessWidget {
  const _LandingBody();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: SerManosTexts.subtitle1(
                '"El esfuerzo desinteresado para llevar alegría a los demás será el comienzo de una vida más feliz para nosotros"',
                color: SerManosColors.black,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LandingFooter extends StatelessWidget {
  const _LandingFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SerManosElevatedButton(
            label: 'Iniciar Sesión', onPressed: () => context.goNamed("login")),
        const SizedBox(height: 28),
        SerManosTextButton(
            label: "Registrarse", onPressed: () => context.goNamed("signup")),
        const SizedBox(height: 44),
      ],
    );
  }
}
