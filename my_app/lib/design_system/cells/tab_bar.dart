import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/molecules/tab.dart';

class SerManosTabBar extends TabBar {
  final TabController tabController;

  SerManosTabBar({super.key, required this.tabController})
      : super(
            indicator: const BoxDecoration(
                color: SerManosColorFoundations.tabSelectedColor,
                border: Border(
                    bottom: BorderSide(
                        width: 1.5,
                        color: SerManosColorFoundations.tabSelectedLineColor))),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return SerManosColorFoundations.getMaterialColor(
                          SerManosColorFoundations.buttonOverlayColor)
                      .withOpacity(0.04);
                }
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return SerManosColorFoundations.getMaterialColor(
                          SerManosColorFoundations.buttonOverlayColor)
                      .withOpacity(0.12);
                }
              },
            ),
            tabs: const [
              SerManosTab(tabText: "Postularse"),
              SerManosTab(tabText: "Mi perfil"),
              SerManosTab(tabText: "Novedades"),
            ],
            controller: tabController);
}
