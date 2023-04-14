import 'package:flutter/material.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosVolunteerCard extends StatelessWidget {
  const SerManosVolunteerCard(
      {super.key,
      required this.imagePath,
      required this.cardOverlineText,
      required this.cardText});

  final String imagePath;
  final String cardText;
  final String cardOverlineText;
  final Color cardOverlineTextColor =
      SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTextColor = SerManosColorFoundations.cardTextColor;

  void onPressedFunction() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: SerManosColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(2.0),
            topRight: Radius.circular(2.0),
            bottomLeft: Radius.circular(2.0),
            bottomRight: Radius.circular(2.0),
          ),
          boxShadow: SerManosShadows.boxShadows2,
        ),
        // child: Text("Hi"),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16),
              child: SerManosTexts.overline(
                cardOverlineText,
                color: cardOverlineTextColor,
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: SerManosTexts.subtitle1(
                        cardText,
                        color: cardTextColor,
                      )),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SerManosIconButton(
                        icon: SerManosIcons.favoriteIconOutline,
                        iconColor: SerManosColorFoundations.iconActiveColor,
                        onPressed: onPressedFunction,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SerManosIconButton(
                            icon: SerManosIcons.locationIcon,
                            iconColor: SerManosColorFoundations.iconActiveColor,
                            onPressed: onPressedFunction,
                          )),
                    ],
                  )
                ],
              )
            ]
                .map((widget) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: widget,
                    ))
                .toList(),
          ),
        ]),
      ),
    );
  }
}
