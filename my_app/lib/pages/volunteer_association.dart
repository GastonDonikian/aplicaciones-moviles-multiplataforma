import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/services/user_service.dart';
import '../design_system/cells/cards.dart';
import '../models/volunteer.dart';
import '../utils/map_utils.dart';




class VolunteerAssociationPage extends ConsumerStatefulWidget {
  final VolunteerAssociation volunteerAssociation;
  final String id;

  static String get routeName => 'association';
  static String get routeLocation => 'association/:id';

  const VolunteerAssociationPage({super.key, required this.volunteerAssociation, required this.id});

  @override
  ConsumerState<VolunteerAssociationPage> createState() => _VolunteerAssociationPageState();
}

class _VolunteerAssociationPageState extends ConsumerState<VolunteerAssociationPage> {
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  Volunteer? currentUser;
  onPressedShowModal(BuildContext context, VolunteerAssociation volunteerAssociation, String header, Function confirmAction) {
    showDialog(
      context: context,
      builder: ((BuildContext context) {
        return SerManosModal(
          header: header,
          title: volunteerAssociation.name,
          schedule: volunteerAssociation.schedule,
          address: volunteerAssociation.address,
          onPressedCanceled: () => context.pop(),
          onPressedConfirmed: () {
            confirmAction();
          },
        );
      }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentUser = ref.read(userProvider);
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
                          //TODO: Implement abandonCurrentPostulate, abandonOtherPostulate and confirm
                        PostulationDispatcher(volunteer: currentUser! ,volunteerAssociation: widget.volunteerAssociation,
                              onPressedPostulate: () => onPressedShowModal(context, widget.volunteerAssociation, 'Te estas por postular a',() {}),
                              abandonCurrentPostulate: () => onPressedShowModal(context, widget.volunteerAssociation, 'Estas por dejar',() {}),
                              abandonOtherPostulate: () => onPressedShowModal(context, widget.volunteerAssociation, 'Estas por dejar',() {}),
                        )

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

class PostulationDispatcher extends StatelessWidget {
  const PostulationDispatcher(
      {super.key,
        required this.volunteer,
        required this.volunteerAssociation,
        required this.onPressedPostulate,
        required this.abandonOtherPostulate,
        required this.abandonCurrentPostulate,
      });

  final Volunteer volunteer;
  final VolunteerAssociation volunteerAssociation;
  final void Function() onPressedPostulate;
  final void Function() abandonOtherPostulate;
  final void Function() abandonCurrentPostulate;

  @override
  Widget build(BuildContext build){
    if(volunteerAssociation.availableCapacity == 0){
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SerManosTexts.body1('No hay vacantes disponibles para postularse', color: SerManosColorFoundations.defaultBodyColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 32),
            child: SerManosElevatedButton(label: 'Postularme',disabled: true,onPressed: () => {},),
          ),
        ]
      );
    }
    if(volunteer.currentAssociation == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 32),
        child: SerManosElevatedButton(label: 'Postularme', onPressed: () => onPressedPostulate(),),
      );
    }
    if(volunteerAssociation.id != volunteer.currentAssociation) {
      return Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 24),
                child: SerManosTexts.body1('Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.',
                  color: SerManosColorFoundations.defaultBodyColor,)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SerManosTextButton(label: 'Abandonar voluntariado actual',onPressed: abandonOtherPostulate,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 32),
              child: SerManosElevatedButton(label: 'Postularme',disabled: true,onPressed: () => {},),
            ),
          ]
      );
    }
    if(volunteer.confirmedByAssociation != null && volunteer.confirmedByAssociation == true) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SerManosTexts.headline2('Estas participando'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SerManosTexts.body1('La organización confirmó que ya estas participando de este voluntariado',
              color: SerManosColorFoundations.defaultBodyColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 68),
            child: SerManosTextButton(label: 'Abandonar voluntariado',onPressed: abandonCurrentPostulate,),
          ),
        ],
      );
    }
    else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: SerManosTexts.headline2('Te has postulado'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SerManosTexts.body1('Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.',
              color: SerManosColorFoundations.defaultBodyColor,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 68),
            child: SerManosTextButton(label: 'Retirar postulación',onPressed: abandonCurrentPostulate,),
          ),
        ],
      );
    }
  }
}
