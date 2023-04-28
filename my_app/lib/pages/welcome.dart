import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/cells/app_bar.dart';
import 'package:my_app/design_system/foundations/text_styles.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/status_bar.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SerManosStatusBar(
      body: SerManosGridPadding(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(image: AssetImage("assets/square_logo.png")),
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
                    children: const [
                      Expanded(
                        child: Text(
                          "Nunca subestimes tu habilidad para mejorar la vida de alguien.",
                          style: SerManosTextStyles.subtitle1(
                            color: SerManosColors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SerManosElevatedButton(
                    label: 'Comenzar',
                    onPressed: () => context.goNamed("home"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 92),
          ],
        ),
      ),
    );
  }
}
