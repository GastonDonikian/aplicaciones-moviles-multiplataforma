//ONLY FOR TESTING PURPOSE, will be deleted later
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/molecules/inputs.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/volunteer_association.dart';

class ApplyTab extends StatelessWidget {
  const ApplyTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<VolunteerAssociation> volunteerAssociations = [
      myVolunteerAssociation,
      myVolunteerAssociation,
      myVolunteerAssociation,
      myVolunteerAssociation,
      myVolunteerAssociation,
    ];

    void goToVolunteerAssociation(VolunteerAssociation volunteerAssociation) {
      context.goNamed("association", extra: volunteerAssociation, params: {"id": volunteerAssociation.name});
    }

    void onSearchEnter(String query) {
      // TODO: query search
    }

    return Column(
      children: [
        const SizedBox(height: 24),
        SerManosGridPadding(
          child: CustomSearchInput(
            placeholder: 'Buscar',
            label: 'Buscar',
            eraseIcon: SerManosIcons.closeIcon,
            defaultIcon: SerManosIcons.searchIcon,
            onEnter: onSearchEnter,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: ListView.separated(
              itemCount: volunteerAssociations.length,
              itemBuilder: (context, index) {
                return SerManosGridPadding(
                  child: SerManosVolunteerCard(
                    imagePath: volunteerAssociations[index].imagePath,
                    cardOverlineText: volunteerAssociations[index].associationType,
                    cardTitle: volunteerAssociations[index].name,
                    vacancy: 10,
                    onPressedFav: () => {},
                    onPressedLocation: () => {},
                    onPressedImage: () => goToVolunteerAssociation(volunteerAssociations[index]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 24),
            ),
          ),
        ),
      ],
    );
  }
}

VolunteerAssociation myVolunteerAssociation = VolunteerAssociation(
  imagePath: 'assets/volunteer_card_1.png',
  associationType: 'Acción Social',
  name: 'Un Techo Para mi Pais',
  schedule: 'Días sábados de 9.00 a 17.00 horas.',
  address: 'A dos horas al sur de Vicente López en la ciudad de Buenos',
  location: 'Caballito',
  description: 'A dos horas al sur de Vicente López en la ciudad de Buenos Aires.',
);
