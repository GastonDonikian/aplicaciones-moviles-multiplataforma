import 'package:flutter/material.dart';
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
import 'package:my_app/services/user_service.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool _hasProfileCompleted = false;
  Volunteer dummyEmptyVolunteer =
      Volunteer(email: "email@itba.edu.ar", name: "User", surname: "Test");
  Volunteer dummyCompletedVolunteer = Volunteer(
    email: "email@itba.edu.ar",
    name: "User",
    surname: "Test",
    imagePath:
        "https://fastly.picsum.photos/id/357/200/200.jpg?hmac=hHhE00vBpBPSjAiUhwzFKQi9PsCWu7sblLKC2rT6Fn8",
    gender: Gender.man,
    phone: "1234-5678",
    birthDate: DateTime(1999, 8, 15),
  );

  //Testing purposes, to switch from one profile view to another
  void changeProfile() {
    setState(() {
      _hasProfileCompleted = !_hasProfileCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _hasProfileCompleted
        ? ProfileCompleted(
            onPressed: changeProfile,
            volunteer: dummyCompletedVolunteer,
          )
        : ProfileEmpty(
            onPressed: changeProfile,
            volunteer: dummyEmptyVolunteer,
          );
  }
}

class ProfileCompleted extends StatelessWidget {
  const ProfileCompleted(
      {super.key, required this.onPressed, required this.volunteer});

  final void Function() onPressed;
  final Volunteer volunteer;

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
                  "Fecha de nacimiento": volunteer.birthDate.toString(),
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
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SerManosTextButton(
                  label: "Cerrar Sesión",
                  onPressed: () {},
                  textColorActive: SerManosColorFoundations.buttonErrorColor,
                ),
              ),
              SerManosTextButton(label: "Change profile", onPressed: onPressed)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileEmpty extends StatelessWidget {
  const ProfileEmpty(
      {super.key, required this.onPressed, required this.volunteer});

  final void Function() onPressed;
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
                onPressed: () {},
              ),
            ),
            SerManosTextButton(label: "Change profile", onPressed: onPressed)
          ],
        ),
      ),
    );
  }
}
