import 'package:flutter/material.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/models/volunteer_association.dart';

class SerManosCurrentActivityWidget extends StatelessWidget {
  const SerManosCurrentActivityWidget({super.key, required this.association, required this.onAssociationPressed});

  final VolunteerAssociation association;
  final Function(VolunteerAssociation) onAssociationPressed;

  void onLocationPressed() {
    association.openLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerManosTexts.headline1("Tu actividad", color: SerManosColors.black),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => onAssociationPressed(association),
          child: SerManosCurrentVolunteeringCard(
            cardOverlineText: association.associationType,
            cardTitle: association.name,
            onLocationPressed: onLocationPressed,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
