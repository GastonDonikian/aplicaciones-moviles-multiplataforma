import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosModal extends StatelessWidget {
  const SerManosModal({
    super.key,
    required this.title,
    required this.schedule,
    required this.address,
    required this.onPressedCanceled,
    required this.onPressedConfirmed,
  });

  final String title;
  final String schedule;
  final String address;
  final void Function()? onPressedCanceled;
  final void Function()? onPressedConfirmed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: SerManosColorFoundations.modalBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.boxShadows3,
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SerManosTexts.subtitle1(
                          "Te estas por postular a",
                          color: SerManosColorFoundations.modalSubtitleTextColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SerManosTexts.headline2(
                          title,
                          color: SerManosColorFoundations.modalHeadlineTextColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SerManosTexts.body1(
                            schedule,
                            color: SerManosColorFoundations.modalBodyTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SerManosTexts.body1(
                            address,
                            color: SerManosColorFoundations.modalBodyTextColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Cancelar",
                        onPressed: onPressedCanceled,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Confirmar",
                        onPressed: onPressedConfirmed,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
