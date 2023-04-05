import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key});

  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;
  final Color defaultColor = SerManosColorFoundations.tabColor;
  final Color selectedColor = SerManosColorFoundations.tabSelectedColor;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Container(
            color: SerManosColorFoundations.tabColor,
            child: const Tab(text: "Postularse")),
        Container(
            color: SerManosColorFoundations.tabColor,
            child: const Tab(text: "Mi perfil")),
        Container(
            color: SerManosColorFoundations.tabColor,
            child: const Tab(text: "Novedades")),
      ],
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return SerManosColorFoundations.getMaterialColor(overlayColor)
                .withOpacity(0.04);
          }
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) {
            return SerManosColorFoundations.getMaterialColor(overlayColor)
                .withOpacity(0.12);
          }
        },
      ),
    );
  }
}
