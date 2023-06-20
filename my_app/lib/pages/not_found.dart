import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/registration_squeleton.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/screens/apply.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RegistrationLayout(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        child: SerManosTexts.headline1(
          "Página no encontrada",
          color: SerManosColors.black,
        ),
      ),
      footer: Container(
        padding: const EdgeInsets.only(bottom: 32),
        child: SerManosElevatedButton(
          label: "Ir a Inicio",
          onPressed: () => context.goNamed(ApplyTab.routeName),
        ),
      ),
    );
  }
}
