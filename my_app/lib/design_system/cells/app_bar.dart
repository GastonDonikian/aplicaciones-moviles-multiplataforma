import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/tab.dart';

class SerManosAppBar extends StatelessWidget {
  SerManosAppBar({super.key});

  final Color overlayColor = SerManosColorFoundations.buttonOverlayColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
              SerManosTab(tabText: "Postularse"),
              SerManosTab(tabText: "Mi perfil"),
              SerManosTab(tabText: "Novedades")
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
          ),
        ),
        body: const TabBarView(children: [
          Icon(Icons.add),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ]));
  }
}
