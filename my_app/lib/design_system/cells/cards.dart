import 'package:flutter/material.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/components.dart';
import 'package:my_app/design_system/molecules/inputs.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosVolunteerCard extends StatelessWidget {
  const SerManosVolunteerCard(
      {super.key,
      required this.imagePath,
      required this.cardOverlineText,
      required this.cardTitle,
      required this.vacancy,
      required this.onPressedFav,
      required this.onPressedLocation,
      required this.onPressedImage});

  final String imagePath;
  final String cardTitle;
  final int vacancy;
  final String cardOverlineText;
  final Color cardOverlineTextColor = SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  final void Function()? onPressedFav;
  final void Function()? onPressedLocation;
  final void Function()? onPressedImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: SerManosColors.white,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          boxShadow: SerManosShadows.boxShadows2,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: SerManosTexts.overline(
                            cardOverlineText.toUpperCase(),
                            color: cardOverlineTextColor,
                          ),
                        ),
                        SizedBox(
                          child: SerManosTexts.subtitle1(
                            cardTitle,
                            color: cardTitleColor,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SerManosVacancy(vacancy: vacancy),
                      ],
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
                ],
              ),
            ),
          ],
        ),
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
      required this.onPressed});

  final void Function()? onPressed;
  final String imagePath;
  final String cardTitle;
  final String cardText;
  final String cardOverlineText;
  final Color cardOverlineTextColor = SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  final Color cardTextColor = SerManosColorFoundations.cardTextColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: SerManosColors.white,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          boxShadow: SerManosShadows.boxShadows2,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Image(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child:
                                  SerManosTexts.overline(cardOverlineText.toUpperCase(), color: cardOverlineTextColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SerManosTexts.subtitle1(
                                cardTitle,
                                color: SerManosColorFoundations.cardTitleColor,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: SerManosTexts.body2(
                                cardText,
                                color: SerManosColorFoundations.cardTextColor,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SerManosTextButton(label: "Leer Más", onPressed: onPressed)),
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

class SerManosCurrentVolunteeringCard extends StatelessWidget {
  const SerManosCurrentVolunteeringCard(
      {super.key, required this.cardOverlineText, required this.cardTitle, required this.onLocationPressed});

  final String cardTitle;
  final String cardOverlineText;
  final Color cardOverlineTextColor = SerManosColorFoundations.cardOverlineTextColor;
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  final void Function()? onLocationPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SerManosColors.primary5,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        boxShadow: SerManosShadows.boxShadows2,
        border: Border.fromBorderSide(BorderSide(color: SerManosColors.primary100, width: 2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SerManosTexts.overline(
                          cardOverlineText.toUpperCase(),
                          color: cardOverlineTextColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: SerManosTexts.subtitle1(
                          cardTitle,
                          color: cardTitleColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SerManosIconButton(
              icon: SerManosIcons.locationIcon,
              iconColor: SerManosColorFoundations.iconActiveColor,
              onPressed: onLocationPressed,
            )
          ],
        ),
      ),
    );
  }
}

class SerManosInputCard extends StatelessWidget {
  const SerManosInputCard({
    super.key,
    required this.cardTitle,
    required this.options,
    required this.onChangedValidity,
    required this.onSaved,
  });

  final String cardTitle;
  final List<String> options;
  final Function(bool) onChangedValidity;
  final Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return SerManosBasicCard(
      cardTitle: cardTitle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Column(
          children: [
            SerManosCheckboxFormField(
              options: options,
              onChangeValidity: onChangedValidity,
              onSaved: onSaved,
              validator: (value) {
                if (value == null) {
                  return "Selecciona una opción";
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SerManosPhotoInputCard extends StatefulWidget {
  const SerManosPhotoInputCard({super.key, required this.image});

  final String? image;

  @override
  State<SerManosPhotoInputCard> createState() => _SerManosPhotoInputCardState();
}

class _SerManosPhotoInputCardState extends State<SerManosPhotoInputCard> {
  // TODO: implement photo upload

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: SerManosColors.secondary25,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SerManosTexts.subtitle1("Foto de perfil", color: Colors.black),
              if (widget.image != null) const SizedBox(height: 8),
              if (widget.image != null) SerManosButton(label: "Cambiar foto", onPressed: () {})
            ],
          ),
          if (widget.image == null)
            SerManosButton(
              label: "Subir foto",
              onPressed: () {},
            )
          else
            SerManosAvatar(imageUrl: widget.image!),
        ],
      ),
    );
  }
}

class SerManosInformationCard extends StatelessWidget {
  const SerManosInformationCard({super.key, required this.cardTitle, required this.information});

  final String cardTitle;
  final Map<String, String> information;

  @override
  Widget build(BuildContext context) {
    return SerManosBasicCard(
      cardTitle: cardTitle,
      child: SizedBox(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SerManosTexts.overline(
                        information.keys.elementAt(index).toUpperCase(),
                        color: SerManosColorFoundations.cardOverlineTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                        child: SerManosTexts.body1(
                      information.values.elementAt(index),
                      color: Colors.black,
                    )),
                  ],
                ),
              ],
            );
          },
          itemCount: information.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8);
          },
        ),
      ),
    );
  }
}

class SerManosLocationCard extends StatelessWidget {
  const SerManosLocationCard(
      {super.key,
      required this.cardTitle,
      required this.location,
      this.withMap = false,
      required this.onLocationPressed});

  final String cardTitle;
  final bool withMap; // TODO: add map
  final String location;
  final Function() onLocationPressed;

  @override
  Widget build(BuildContext context) {
    return SerManosBasicCard(cardTitle: cardTitle, child: _buildLocationCard(context, location));
  }

  Widget _buildLocationCard(BuildContext context, String location) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SerManosTexts.overline(
                        "Dirección".toUpperCase(),
                        color: SerManosColorFoundations.cardOverlineTextColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                        child: SerManosTexts.body1(
                      location,
                      color: Colors.black,
                    )),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onLocationPressed,
            icon: const Icon(SerManosIcons.locationIcon, color: SerManosColorFoundations.buttonActiveColor),
          )
        ],
      ),
    );
  }
}

class SerManosBasicCard extends StatelessWidget {
  const SerManosBasicCard({super.key, required this.cardTitle, required this.child});

  final Widget child;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: SerManosColors.grey10,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(children: [
          Row(children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: const BoxDecoration(
                color: SerManosColors.secondary10,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
              child: SerManosTexts.subtitle1(
                cardTitle,
                color: Colors.black,
              ),
            )),
          ]),
          child,
        ]));
  }
}
