import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/app_bar.dart';
import 'package:my_app/design_system/cells/modal.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/components.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/current_association.dart';
import 'package:my_app/models/volunteer_association.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:my_app/providers/current_association_provider.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/screens/apply.dart';
import 'package:my_app/services/volunteer_service.dart';
import '../design_system/cells/cards.dart';
import '../models/volunteer.dart';
import '../utils/map_utils.dart';

class VolunteerAssociationPage extends ConsumerStatefulWidget {
  final VolunteerAssociation? maybeVolunteerAssociation;
  final String id;

  static String get routeName => 'association';
  static String get routeLocation => 'association/:id';

  const VolunteerAssociationPage({super.key, required this.maybeVolunteerAssociation, required this.id});

  @override
  ConsumerState<VolunteerAssociationPage> createState() => _VolunteerAssociationPageState();
}

class _VolunteerAssociationPageState extends ConsumerState<VolunteerAssociationPage> {
  final Color cardTitleColor = SerManosColorFoundations.cardTitleColor;
  CurrentAssociation? currentAssociation;
  Volunteer? currentUser;
  VolunteerAssociation? volunteerAssociation;
  bool loading = false;

  onPressedShowProfileModal(
      BuildContext context, VolunteerAssociation volunteerAssociation, String header, Function confirmAction) {
    showDialog(
      context: context,
      builder: ((BuildContext context) {
        return SerManosIncompleteProfileModal(
          onPressedCanceled: () => context.pop(),
          onPressedEditProfile: (() {
            context.pushNamed('edit_profile').then((value) {
              currentUser = ref.read(userProvider);
              if (currentUser!.profileCompleted) {
                context.pop();
                onPressedShowModal(volunteerAssociation, header, confirmAction);
              } else {
                context.pop();
              }
            });
          }),
        );
      }),
    );
  }

  onPressedPostulate(BuildContext context) async {
    setState(() {
      loading = true;
    });
    await ref.read(currentAssociationProvider.notifier).subscribeToAssociation(volunteerAssociation!.id);
    setState(() {
      currentAssociation = ref.read(currentAssociationProvider)!;
      loading = false;
    });
  }

  onPressedAbandonPostulate() async {
    setState(() {
      loading = true;
    });
    var currentAssociationId = currentAssociation!.currentAssociation.id;
    await ref.read(currentAssociationProvider.notifier).unsubscribeFromCurrentAssociation();
    var newVolunteerAsociation = volunteerAssociation;
    if (currentAssociationId == volunteerAssociation!.id) {
      newVolunteerAsociation = await VolunteerAssociationService().getVolunteerById(currentAssociationId);
    }
    setState(() {
      currentAssociation = null;
      volunteerAssociation = newVolunteerAsociation;
      loading = false;
    });
  }

  onPressedShowModal(VolunteerAssociation volunteerAssociation, String header, Function confirmAction) {
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
            context.pop();
          },
        );
      }),
    );
  }

  void loadVolunteerAssociation() async {
    VolunteerAssociation? association = await VolunteerAssociationService().getVolunteerById(widget.id);
    if (association == null) {
      context.goNamed(ApplyTab.routeName);
    } else {
      setState(() {
        volunteerAssociation = association;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    currentAssociation = ref.read(currentAssociationProvider);
    if (widget.maybeVolunteerAssociation == null) {
      loadVolunteerAssociation();
    } else {
      setState(() {
        volunteerAssociation = widget.maybeVolunteerAssociation!;
      });
    }
    currentUser = ref.read(userProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SerManosOpacityAppBar(
          leading: IconButton(
        icon: const Icon(
          SerManosIcons.backIcon,
          color: Colors.white,
        ),
        onPressed: () => context.pop(),
      )),
      body: volunteerAssociation == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              top: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          volunteerAssociation!.imagePath,
                          fit: BoxFit.fitWidth,
                          height: 243,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SerManosGridPadding(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: SerManosTexts.overline(volunteerAssociation!.associationType.toUpperCase(),
                                  color: SerManosColorFoundations.defaultOverlineColor),
                            ),
                            SerManosTexts.headline1(
                              volunteerAssociation!.name,
                              color: cardTitleColor,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: SerManosTexts.body1(volunteerAssociation!.subtitle,
                                    color: SerManosColorFoundations.linkTextColor)),
                            Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: SerManosTexts.headline2('Sobre la actividad',
                                    color: SerManosColorFoundations.defaultHeadlineColor)),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: SerManosTexts.body1(
                                volunteerAssociation!.description,
                                color: SerManosColorFoundations.defaultBodyColor,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: SerManosLocationCard(
                                cardTitle: "Ubicación",
                                location: volunteerAssociation!.address,
                                onLocationPressed: () => MapUtils.openMap(
                                    volunteerAssociation!.location.latitude, volunteerAssociation!.location.longitude),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: SerManosTexts.headline2('Participar del voluntariado',
                                    color: SerManosColorFoundations.defaultHeadlineColor)),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: MarkdownBody(
                                data: volunteerAssociation!.requirements,
                                listItemCrossAxisAlignment: MarkdownListItemCrossAxisAlignment.start,
                              ),
                            ),
                            SerManosVacancy(vacancy: volunteerAssociation!.availableCapacity),
                            PostulationDispatcher(
                              loading: loading,
                              currentAssociation: currentAssociation,
                              volunteerAssociation: volunteerAssociation!,
                              onPressedPostulate: () {
                                if (currentUser!.profileCompleted) {
                                  onPressedShowModal(
                                    volunteerAssociation!,
                                    'Te estas por postular a',
                                    () => onPressedPostulate(context),
                                  );
                                } else {
                                  onPressedShowProfileModal(context, volunteerAssociation!, 'Te estas por postular a',
                                      () => onPressedPostulate(context));
                                }
                              },
                              abandonCurrentPostulate: () => onPressedShowModal(
                                  volunteerAssociation!,
                                  currentAssociation!.confirmed
                                      ? '¿Estás seguro que querés abandonar tu voluntariado?'
                                      : '¿Estás seguro que querés retirar tu postulación?',
                                  onPressedAbandonPostulate),
                              abandonOtherPostulate: () => onPressedShowModal(
                                  currentAssociation!.currentAssociation,
                                  currentAssociation!.confirmed
                                      ? '¿Estás seguro que querés abandonar tu voluntariado?'
                                      : '¿Estás seguro que querés retirar tu postulación?',
                                  onPressedAbandonPostulate),
                            )
                          ],
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
  const PostulationDispatcher({
    super.key,
    this.currentAssociation,
    required this.volunteerAssociation,
    required this.onPressedPostulate,
    required this.abandonOtherPostulate,
    required this.abandonCurrentPostulate,
    this.loading = false,
  });

  final CurrentAssociation? currentAssociation;
  final VolunteerAssociation volunteerAssociation;
  final void Function() onPressedPostulate;
  final void Function() abandonOtherPostulate;
  final void Function() abandonCurrentPostulate;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        _buildPostulationStatus(context, loading) ?? Container(),
        _buildPostulationButton(context, loading),
      ],
    );
  }

  Widget? _buildPostulationStatus(BuildContext context, bool loading) {
    bool isCurrentAssociation =
        currentAssociation != null && currentAssociation!.currentAssociation.id == volunteerAssociation.id;
    if (volunteerAssociation.availableCapacity == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: SerManosTexts.body1(
          'No hay vacantes disponibles para postularse',
          color: SerManosColorFoundations.defaultBodyColor,
        ),
      );
    } else if (isCurrentAssociation) {
      if (currentAssociation!.confirmed) {
        return Column(
          children: [
            SerManosTexts.headline2('Estas participando', color: SerManosColorFoundations.defaultHeadlineColor),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: SerManosTexts.body1(
                'La organización confirmó que ya estas participando de este voluntariado',
                color: SerManosColorFoundations.defaultBodyColor,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            SerManosTexts.headline2('Te has postulado', color: SerManosColorFoundations.defaultHeadlineColor),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: SerManosTexts.body1(
                'Pronto la organización se pondrá en contacto contigo y te inscribirá como participante.',
                color: SerManosColorFoundations.defaultBodyColor,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      }
    } else if (!isCurrentAssociation && currentAssociation != null) {
      return Column(children: [
        SerManosTexts.body1(
          'Ya estas participando en otro voluntariado, debes abandonarlo primero para postularte a este.',
          color: SerManosColorFoundations.defaultBodyColor,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: SerManosTextButton(
            label: 'Abandonar voluntariado actual',
            onPressed: abandonOtherPostulate,
            loading: loading,
          ),
        ),
      ]);
    } else {
      return null;
    }
  }

  Widget _buildPostulationButton(BuildContext context, bool loading) {
    bool isCurrentAssociation =
        currentAssociation != null && currentAssociation!.currentAssociation.id == volunteerAssociation.id;
    if (isCurrentAssociation) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 34),
        child: SerManosTextButton(
          label: currentAssociation!.confirmed ? 'Abandonar voluntariado' : 'Retirar postulación',
          onPressed: abandonCurrentPostulate,
          loading: loading,
        ),
      );
    } else {
      return SerManosElevatedButton(
        label: 'Postularme',
        disabled: volunteerAssociation.availableCapacity == 0 || currentAssociation != null,
        onPressed: volunteerAssociation.availableCapacity == 0 ? null : onPressedPostulate,
        loading: loading,
      );
    }
  }
}
