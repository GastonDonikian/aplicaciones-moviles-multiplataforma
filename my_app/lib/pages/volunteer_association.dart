import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/modal.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/volunteer_association.dart';

class VolunteerAssociationPage extends StatefulWidget {
  final VolunteerAssociation volunteerAssociation;
  final String id;

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
          location: volunteerAssociation.location,
          onPressedCanceled: () => context.pop(),
          onPressedConfirmed: () {
            // TODOO: Implementar postulación
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: SerManosTexts.headline1(
                                    widget.volunteerAssociation.name,
                                    color: cardTitleColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: SerManosTexts.body1(
                                    widget.volunteerAssociation.description,
                                    color: SerManosColors.grey75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SerManosElevatedButton(
                        label: 'Postularme',
                        onPressed: () => onPressedShowModal(context, widget.volunteerAssociation),
                      ),
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
