import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/modal.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/components.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../design_system/cells/cards.dart';
import '../models/volunteer.dart';
import '../utils/map_utils.dart';




class VolunteerAssociationPage extends StatefulWidget {
  final VolunteerAssociation volunteerAssociation;
  final String id;

  static String get routeName => 'association';
  static String get routeLocation => 'association/:id';

  const VolunteerAssociationPage({super.key, required this.volunteerAssociation, required this.id});

  @override
  State<VolunteerAssociationPage> createState() => _VolunteerAssociationPageState();
}

class _VolunteerAssociationPageState extends State<VolunteerAssociationPage> {
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;

  onPressedShowModal(BuildContext context, VolunteerAssociation volunteerAssociation) {
    showDialog(
      context: context,
      builder: ((BuildContext context) {
        return SerManosModal(
          title: volunteerAssociation.name,
          schedule: volunteerAssociation.schedule,
          address: volunteerAssociation.address,
          onPressedCanceled: () => context.pop(),
          onPressedConfirmed: () {
            // TODO: Implementar postulación
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.black, Colors.black.withOpacity(0.0)],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            SerManosIcons.backIcon,
            color: Colors.white,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage(widget.volunteerAssociation.imagePath),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SerManosGridPadding(
                  child: SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: SerManosTexts.overline(widget.volunteerAssociation.associationType.toUpperCase(),
                            color: SerManosColorFoundations.defaultOverlineColor),
                      ),
                      SerManosTexts.headline1(
                        widget.volunteerAssociation.name,
                        color: cardTitleColor,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: SerManosTexts.subtitle1(widget.volunteerAssociation.subtitle, color: SerManosColorFoundations.linkTextColor)),
                      Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: SerManosTexts.headline2('Sobre la actividad', color: SerManosColorFoundations.defaultHeadlineColor)
                      ),
                      SerManosTexts.body1(
                        widget.volunteerAssociation.description,
                        color: SerManosColorFoundations.defaultBodyColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: SerManosLocationCard(
                        cardTitle: "Ubicación",
                        location: widget.volunteerAssociation.address,
                        onLocationPressed: () => MapUtils.openMap(widget.volunteerAssociation.location.latitude,widget.volunteerAssociation.location.longitude),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                          child: SerManosTexts.headline2('Participar del voluntariado', color: SerManosColorFoundations.defaultHeadlineColor)
                      ),
                      MarkdownBody(
                        data: widget.volunteerAssociation.requirements,
                        listItemCrossAxisAlignment: MarkdownListItemCrossAxisAlignment.start,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: SerManosVacancy(vacancy: widget.volunteerAssociation.availableCapacity)
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: SerManosElevatedButton(
                          label: 'Postularme',
                          onPressed: () => onPressedShowModal(context, widget.volunteerAssociation),
                      ),
    ),
                    ],
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class PostulationDispatcher extends StatelessWidget {
//   PostulationDispatcher(
//       {super.key,
//         required this.volunteer,
//         required this.volunteerAssociation
//       });
//
//   final Volunteer volunteer;
//   final VolunteerAssociation volunteerAssociation;
//
//   @override
//   Widget build(BuildContext build){
//     if(this.volunteerAssociation.)
//   }
// }
