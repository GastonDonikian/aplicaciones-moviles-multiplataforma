import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class SerManosVacancy extends StatelessWidget {
  const SerManosVacancy({Key? key, required this.vacancy}) : super(key: key);

  final int vacancy;

  @override
  Widget build(BuildContext context) {
    bool isVacant = vacancy > 0;

    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          color: isVacant ? SerManosColors.secondary25 : SerManosColors.grey25,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              SerManosTexts.body2(
                "Vacantes:",
                color: Colors.black,
              ),
              const SizedBox(width: 11),
              Icon(
                SerManosIcons.personIcon,
                color: isVacant
                    ? SerManosColorFoundations.vacancyEnabledColor
                    : SerManosColorFoundations.vacancyDisabledColor,
              ),
              SerManosTexts.subtitle1(
                '$vacancy',
                color: isVacant
                    ? SerManosColorFoundations.vacancyEnabledColor
                    : SerManosColorFoundations.vacancyDisabledColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SerManosAvatar extends StatelessWidget {
  const SerManosAvatar({Key? key, this.imageUrl, this.big = false})
      : super(key: key);

  final String? imageUrl;
  final bool big;

  @override
  Widget build(BuildContext context) {
    var radius = big ? 55.0 : 42.0;
    radius = imageUrl == null ? 50 : radius;

    if (imageUrl == null) {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: const AssetImage("assets/profile_image.png"),
      );
    } else {
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: radius,
        backgroundImage: NetworkImage(imageUrl!),
      );
    }
  }
}

class SerManosAvatarFromFile extends StatelessWidget {
  const SerManosAvatarFromFile(
      {Key? key, required this.imageFile, this.big = false})
      : super(key: key);

  final File imageFile;
  final bool big;

  @override
  Widget build(BuildContext context) {
    var radius = big ? 55.0 : 42.0;

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: radius,
      backgroundImage: FileImage(imageFile),
    );
  }
}
