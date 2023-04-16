import 'package:flutter/material.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosVolunteerCard extends StatelessWidget {
  SerManosVolunteerCard(
      {super.key,
      required this.imagePath,
      required this.cardOverlineText,
      required this.cardTitle,
      required this.onPressedFav,
      required this.onPressedLocation});

  final String imagePath;
  final String cardTitle;
  final String cardOverlineText;
  final Color cardOverlineTextColor =
      SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  void Function()? onPressedFav;
  void Function()? onPressedLocation;

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
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: Expanded(
                  child: SerManosTexts.subtitle1(
                    cardTitle,
                    color: cardTitleColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SerManosIconButton(
                        icon: SerManosIcons.favoriteIconOutline,
                        iconColor: SerManosColorFoundations.iconActiveColor,
                        onPressed: onPressedFav,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SerManosIconButton(
                            icon: SerManosIcons.locationIcon,
                            iconColor: SerManosColorFoundations.iconActiveColor,
                            onPressed: onPressedLocation,
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

class SerManosNewsCard extends StatelessWidget {
  SerManosNewsCard(
      {super.key,
      required this.imagePath,
      required this.cardOverlineText,
      required this.cardTitle,
      required this.cardText,
      required this.onPressed});

  void Function()? onPressed;
  final String imagePath;
  final String cardTitle;
  final String cardText;
  final String cardOverlineText;
  final Color cardOverlineTextColor =
      SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  final Color cardTextColor = SerManosColorFoundations.cardTextColor;

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
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            const EdgeInsets.only(top: 16, left: 8, right: 8),
                        child: Expanded(
                          child: SerManosTexts.overline(
                            cardOverlineText,
                            color:
                                SerManosColorFoundations.cardOverlineTextColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: SerManosTexts.subtitle1(
                          cardTitle,
                          color: SerManosColorFoundations.cardTitleColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Expanded(
                          child: SerManosTexts.body2(
                            cardText,
                            color: SerManosColorFoundations.cardTextColor,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12, right: 16),
                        child: SerManosTextButton(
                            label: "Leer Más", onPressed: onPressed),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
