//ONLY FOR TESTING PURPOSE, will be deleted later
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/current_activities.dart';
import 'package:my_app/design_system/cells/volunteering_list.dart';
import 'package:my_app/design_system/molecules/inputs.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:my_app/providers/current_association_provider.dart';
import 'package:my_app/providers/favorites_provider.dart';
import 'package:my_app/services/volunteer_service.dart';

class ApplyTab extends ConsumerStatefulWidget {
  const ApplyTab({super.key});

  static String get routeName => 'home';
  static String get routeLocation => '/home';

  @override
  ConsumerState<ApplyTab> createState() => _ApplyTabState();
}

class _ApplyTabState extends ConsumerState<ApplyTab> {
  List<VolunteerAssociation> volunteerAssociations = [];
  CurrentAssociation? currentAssociation;

  void loadVolunteerAssociations(String? query) {
    VolunteerAssociationService().getVolunteerAssociations(query).then((value) {
      setState(() {
        volunteerAssociations = value;
      });
    });
  }

  @override
  void initState() {
    loadVolunteerAssociations(null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    currentAssociation = ref.read(currentAssociationProvider);

    List<String> favorites = ref.watch(favoritesProvider);
    for (VolunteerAssociation association in volunteerAssociations) {
      association.isFavorite = favorites.contains(association.id);
    }

    void goToVolunteerAssociation(VolunteerAssociation volunteerAssociation) {
      context.pushNamed("association", extra: volunteerAssociation, params: {
        "id": volunteerAssociation.id
      }).then((value) => loadVolunteerAssociations(null));
    }

    void onSearchEnter(String query) {
      loadVolunteerAssociations(query);
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
            onClear: () => loadVolunteerAssociations(null),
          ),
        ),
        const SizedBox(height: 32),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (currentAssociation != null)
                  SerManosGridPadding(
                    child: SerManosCurrentActivityWidget(
                      association: currentAssociation!.currentAssociation,
                      onAssociationPressed: goToVolunteerAssociation,
                    ),
                  ),
                SerManosVolunteeringList(
                  associations: volunteerAssociations,
                  onAssociationClicked: goToVolunteerAssociation,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
