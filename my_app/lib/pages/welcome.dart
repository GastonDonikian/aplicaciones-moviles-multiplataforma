import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/foundations/text_styles.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static String get routeName => 'welcome';
  static String get routeLocation => '/welcome';

  @override
  Widget build(BuildContext context) {
    return const RegistrationLayout(
        body: _WelcomeBody(), footer: _WelcomeFooter());
  }
}

class _WelcomeBody extends StatelessWidget {
  const _WelcomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          children: const [
            Expanded(
              child: Text(
                "¡Bienvenido!",
                style: SerManosTextStyles.headline1(
                  color: SerManosColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 48),
        Row(
          children: [
            Expanded(
              child: SerManosTexts.subtitle1(
                "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                color: SerManosColors.black,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 92),
      ],
    );
  }
}

class _WelcomeFooter extends StatelessWidget {
  const _WelcomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SerManosElevatedButton(
          label: 'Comenzar',
          onPressed: () => context.goNamed("home"),
        ),
        const SizedBox(height: 92),
      ],
    );
  }
}
