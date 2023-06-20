import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/buttons.dart';
import 'package:my_app/design_system/tokens/shadows.dart';

class SerManosModal extends StatelessWidget {
  const SerManosModal({
    super.key,
    required this.header,
    required this.title,
    required this.schedule,
    required this.address,
    required this.onPressedCanceled,
    required this.onPressedConfirmed,
  });
  final String header;
  final String title;
  final String schedule;
  final String address;
  final void Function()? onPressedCanceled;
  final void Function()? onPressedConfirmed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: SerManosColorFoundations.modalBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.boxShadows3,
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SerManosTexts.subtitle1(
                            header,
                            color:
                                SerManosColorFoundations.modalSubtitleTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SerManosTexts.headline2(
                          title,
                          color:
                              SerManosColorFoundations.modalHeadlineTextColor,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Cancelar",
                        onPressed: onPressedCanceled,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Confirmar",
                        onPressed: onPressedConfirmed,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SerManosImageModal extends StatelessWidget {
  const SerManosImageModal({
    super.key,
    required this.onPressedCanceled,
    required this.onPressedGallery,
    required this.onPressedCamera,
  });

  final void Function()? onPressedCanceled;
  final void Function()? onPressedGallery;
  final void Function()? onPressedCamera;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: SerManosColorFoundations.modalBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.boxShadows3,
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    SerManosTexts.subtitle1(
                      "Elegí el metodo para subir la foto",
                      color: SerManosColorFoundations.modalHeadlineTextColor,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Camara",
                        onPressed: onPressedCamera,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Galería",
                        onPressed: onPressedGallery,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SerManosSessionModal extends StatelessWidget {
  const SerManosSessionModal({
    super.key,
    required this.onPressedCanceled,
    required this.onPressedCloseSession,
  });

  final void Function()? onPressedCanceled;
  final void Function()? onPressedCloseSession;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: SerManosColorFoundations.modalBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.boxShadows3,
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    SerManosTexts.subtitle1(
                      "¿Estás seguro que quieres cerrar sesión?",
                      color: SerManosColorFoundations.modalSubtitleTextColor,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Cancelar",
                        onPressed: onPressedCanceled,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Cerrar Sesión",
                        onPressed: onPressedCloseSession,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SerManosIncompleteProfileModal extends StatelessWidget {
  const SerManosIncompleteProfileModal({
    super.key,
    required this.onPressedCanceled,
    required this.onPressedEditProfile,
  });

  final void Function()? onPressedCanceled;
  final void Function()? onPressedEditProfile;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: SerManosColorFoundations.modalBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              boxShadow: SerManosShadows.boxShadows3,
            ),
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Column(
              children: [
                Column(
                  children: [
                    SerManosTexts.subtitle1(
                      "Para postularte primero debes primero completar tus datos",
                      color: SerManosColorFoundations.modalSubtitleTextColor,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Cancelar",
                        onPressed: onPressedCanceled,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: SerManosTextButton(
                        label: "Completar datos",
                        onPressed: onPressedEditProfile,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
