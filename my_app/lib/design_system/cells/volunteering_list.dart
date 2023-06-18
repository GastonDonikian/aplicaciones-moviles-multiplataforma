import 'package:flutter/material.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/volunteer_association.dart';

class SerManosVolunteeringList extends StatelessWidget {
  const SerManosVolunteeringList({super.key, required this.associations, required this.onAssociationClicked});

  final List<VolunteerAssociation> associations;
  final Function(VolunteerAssociation) onAssociationClicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerManosGridPadding(
          child: SerManosTexts.headline1("Voluntariados", color: SerManosColors.black),
        ),
        const SizedBox(height: 16),
        Visibility(
          visible: associations.isNotEmpty,
          replacement: SerManosGridPadding(
            child: Container(
              decoration: BoxDecoration(
                color: SerManosColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: SerManosTexts.subtitle1(
                "Actualmente no hay voluntariados vigentes. Pronto se irán ircorporando nuevos",
                color: SerManosColors.black,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: associations.length,
            itemBuilder: (context, index) {
              return SerManosGridPadding(
                child: SerManosVolunteerCard(
                  imagePath: associations[index].imagePath,
                  cardOverlineText: associations[index].associationType,
                  cardTitle: associations[index].name,
                  vacancy: 10,
                  onPressedFav: () => {},
                  onPressedLocation: () => {},
                  onPressedImage: () => onAssociationClicked(associations[index]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24),
          ),
        ),
      ],
    );
  }
}
