import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/components.dart';
import 'package:my_app/design_system/tokens/colors.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/gender.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/providers/user_provider.dart';
import 'package:my_app/services/user_service.dart';

class ProfileTab extends ConsumerStatefulWidget {
  const ProfileTab({super.key});

  @override
  ConsumerState<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends ConsumerState<ProfileTab> {
  Volunteer? currentUser;
  AuthenticationService authenticationService = AuthenticationService();

  @override
  void initState() {
    super.initState();
    // "ref" can be used in all life-cycles of a StatefulWidget.
    currentUser = ref.read(userProvider);
  }

  void sessionOnPressed() {
    authenticationService.signOut().then((value) {
      ref.read(userProvider.notifier).logOut();
      GoRouter.of(context).go('/login');
    });
  }

  void editOnPressed() {
    GoRouter.of(context).go('/edit_profile');
  }

  @override
  Widget build(BuildContext context) {
    return currentUser!.profileCompleted
        ? ProfileCompleted(
            volunteer: currentUser!,
            editOnPressed: editOnPressed,
            sessionOnPressed: sessionOnPressed,
          )
        : ProfileEmpty(
            volunteer: currentUser!,
            completeOnPressed: editOnPressed,
          );
  }
}

class ProfileCompleted extends StatelessWidget {
  ProfileCompleted(
      {super.key,
      required this.volunteer,
      required this.sessionOnPressed,
      required this.editOnPressed});

  final void Function() sessionOnPressed;
  final void Function() editOnPressed;
  final Volunteer volunteer;
  final DateFormat formatter = DateFormat('DD/MM/YYYY');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SerManosGridPadding(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SerManosAvatar(
                  imageUrl: volunteer.imagePath,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26),
                child: SerManosTexts.overline(
                  "Voluntario".toUpperCase(),
                  color: SerManosColorFoundations.defaultOverlineColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SerManosTexts.subtitle1(
                  volunteer.name,
                  color: SerManosColorFoundations.defaultBodyColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: SerManosTexts.body1(
                  volunteer.email,
                  color: SerManosColorFoundations.linkTextColor,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SerManosInformationCard(
                cardTitle: "Información Personal",
                information: {
                  "Fecha de nacimiento": formatter.format(volunteer.birthDate!),
                  "Genero":
                      volunteer.gender != null ? volunteer.gender!.value : ""
                },
              ),
              const SizedBox(
                height: 32,
              ),
              SerManosInformationCard(
                cardTitle: "Datos de contacto",
                information: {
                  "Telefono": volunteer.phone != null ? volunteer.phone! : "",
                  "E-Mail": volunteer.email
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: SerManosElevatedButton(
                  label: "Editar Perfil",
                  onPressed: editOnPressed,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SerManosTextButton(
                  label: "Cerrar Sesión",
                  onPressed: sessionOnPressed,
                  textColorActive: SerManosColorFoundations.buttonErrorColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileEmpty extends StatelessWidget {
  const ProfileEmpty(
      {super.key, required this.completeOnPressed, required this.volunteer});

  final void Function() completeOnPressed;
  final Volunteer volunteer;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 173.5),
              child: SerManosAvatar(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: SerManosTexts.overline(
                "Voluntario",
                color: SerManosColorFoundations.defaultOverlineColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SerManosTexts.subtitle1(
                volunteer.name,
                color: SerManosColorFoundations.defaultBodyColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: SerManosTexts.overline(
                "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                color: SerManosColorFoundations.defaultOverlineColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 147.5),
              child: SerManosIconTextButton(
                label: "Completar",
                buttonIcon: SerManosIcons.addIcon,
                onPressed: completeOnPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
