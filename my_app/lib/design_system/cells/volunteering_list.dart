import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/providers/favorites_provider.dart';

class SerManosVolunteeringList extends ConsumerWidget {
  const SerManosVolunteeringList(
      {super.key, required this.associations, required this.onAssociationClicked, this.refreshing = false});

  final List<VolunteerAssociation> associations;
  final Function(VolunteerAssociation) onAssociationClicked;
  final bool refreshing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SerManosGridPadding(
          child: SerManosTexts.headline1("Voluntariados", color: SerManosColors.black),
        ),
        const SizedBox(height: 16),
        refreshing
            ? const Center(child: CircularProgressIndicator())
            : Visibility(
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
                        vacancy: associations[index].availableCapacity,
                        isFavorite: associations[index].isFavorite,
                        onPressedFav: () {
                          ref.read(favoritesProvider.notifier).changeFavorite(associations[index]);
                        },
                        onPressedLocation: () => associations[index].openLocation(),
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
