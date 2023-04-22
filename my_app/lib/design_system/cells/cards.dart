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
      required this.cardTitle,
      required this.onPressedFav,
      required this.onPressedLocation,
      required this.onPressedImage,
      this.minCardWidth = 328});

  final String imagePath;
  final String cardTitle;
  final String cardOverlineText;
  final Color cardOverlineTextColor = SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  final void Function()? onPressedFav;
  final void Function()? onPressedLocation;
  final void Function()? onPressedImage;
  final double minCardWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: minCardWidth),
        decoration: const BoxDecoration(
          color: SerManosColors.white,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          boxShadow: SerManosShadows.boxShadows2,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onPressedImage,
                  child: Image(
                    height: 138,
                    image: AssetImage(imagePath),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 16),
              child: SerManosTexts.overline(
                cardOverlineText.toUpperCase(),
                color: cardOverlineTextColor,
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                child: SizedBox(
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
                      const SizedBox(width: 23),
                      SerManosIconButton(
                        icon: SerManosIcons.locationIcon,
                        iconColor: SerManosColorFoundations.iconActiveColor,
                        onPressed: onPressedLocation,
                      ),
                    ],
                  )
                ],
              )
            ]),
          ),
        ]),
      ),
    );
  }
}

class SerManosNewsCard extends StatelessWidget {
  const SerManosNewsCard(
      {super.key,
      required this.imagePath,
      required this.cardOverlineText,
      required this.cardTitle,
      required this.cardText,
      required this.onPressed,
      this.minCardWidth = 328,
      this.maxTextSectionWidth = 194});

  final void Function()? onPressed;
  final String imagePath;
  final String cardTitle;
  final String cardText;
  final String cardOverlineText;
  final Color cardOverlineTextColor = SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  final Color cardTextColor = SerManosColorFoundations.cardTextColor;
  final double minCardWidth;
  final double maxTextSectionWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(minWidth: minCardWidth),
        decoration: const BoxDecoration(
          color: SerManosColors.white,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          boxShadow: SerManosShadows.boxShadows2,
        ),
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
              Container(
                constraints: BoxConstraints(maxWidth: maxTextSectionWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 16),
                            child: SerManosTexts.overline(
                              cardOverlineText,
                              color: SerManosColorFoundations.cardOverlineTextColor,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: SerManosTexts.subtitle1(
                                cardTitle,
                                color: SerManosColorFoundations.cardTitleColor,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 10),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SerManosTextButton(label: "Leer Más", onPressed: onPressed),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
