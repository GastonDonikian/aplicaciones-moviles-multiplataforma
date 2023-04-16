import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosModal extends StatelessWidget {
  SerManosModal(
      {super.key,
      required this.title,
      required this.schedule,
      required this.location});

  final String title;
  final String schedule;
  final String location;
  void Function()? onPressedCanceled;
  void Function()? onPressedConfirmed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 182),
        decoration: const BoxDecoration(
          color: SerManosColorFoundations.modalBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2.0),
            topRight: Radius.circular(2.0),
            bottomLeft: Radius.circular(2.0),
            bottomRight: Radius.circular(2.0),
          ),
          boxShadow: SerManosShadows.boxShadows3,
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: SerManosTexts.subtitle1(
                    "Te estas por postular a",
                    color: SerManosColorFoundations.modalSubtitleTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: SerManosTexts.headline2(
                    title,
                    color: SerManosColorFoundations.modalHeadlineTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: SerManosTexts.body1(
                    schedule,
                    color: SerManosColorFoundations.modalBodyTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: SerManosTexts.body1(
                    location,
                    color: SerManosColorFoundations.modalBodyTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 20),
                  child: SerManosTextButton(
                    label: "Cancelar",
                    onPressed: onPressedCanceled,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 20),
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
    );
  }
}
