import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/cells/cards.dart';
import 'package:my_app/design_system/cells/modal.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/molecules/components.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';
import 'package:my_app/models/gender.dart';
import 'package:my_app/models/volunteer.dart';
import 'package:my_app/providers/user_provider.dart';

class ProfileTab extends ConsumerStatefulWidget {
  const ProfileTab({super.key});

  static String get routeName => 'profile';
  static String get routeLocation => '/profile';

  @override
  ConsumerState<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends ConsumerState<ProfileTab> {
  @override
  void initState() {
    super.initState();
  }

  void sessionOnPressed() {
    ref.read(userProvider.notifier).logOut();
    context.goNamed('landing');
  }

  void editOnPressed() {
    context.goNamed('edit_profile');
  }

  @override
  Widget build(BuildContext context) {
    Volunteer? currentUser = ref.read(userProvider);
    if (currentUser == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return currentUser.profileCompleted
          ? ProfileCompleted(
              volunteer: currentUser,
              editOnPressed: editOnPressed,
              sessionOnPressed: sessionOnPressed,
            )
          : ProfileEmpty(
              volunteer: currentUser,
              completeOnPressed: editOnPressed,
              sessionOnPressed: sessionOnPressed,
            );
    }
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
  final DateFormat formatter = DateFormat('dd/MM/yyy');

  onPressedShowModal(BuildContext context) async {
    showDialog(
      context: context,
      builder: ((BuildContext context) {
        return SerManosSessionModal(
          onPressedCanceled: () => context.pop(),
          onPressedCloseSession: () => sessionOnPressed(),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
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
                    volunteer.getFullname(),
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
                    "Fecha de nacimiento":
                        formatter.format(volunteer.birthDate!),
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
                    onPressed: () {
                      onPressedShowModal(context);
                    },
                    textColorActive: SerManosColorFoundations.buttonErrorColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileEmpty extends StatelessWidget {
  const ProfileEmpty(
      {super.key,
      required this.completeOnPressed,
      required this.volunteer,
      required this.sessionOnPressed});

  final void Function() completeOnPressed;
  final void Function() sessionOnPressed;
  final Volunteer volunteer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SerManosAvatar(),
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
                  volunteer.getFullname(),
                  color: SerManosColorFoundations.defaultBodyColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SerManosTexts.body1(
                  "¡Completá tu perfil para tener acceso a mejores oportunidades!",
                  color: SerManosColorFoundations.defaultOverlineColor,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SerManosIconTextButton(
            label: "Completar",
            buttonIcon: SerManosIcons.addIcon,
            onPressed: completeOnPressed,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: SerManosTextButton(
            label: "Cerrar Sesión",
            onPressed: sessionOnPressed,
            textColorActive: SerManosColorFoundations.buttonErrorColor,
          ),
        ),
      ],
    );
  }
}
