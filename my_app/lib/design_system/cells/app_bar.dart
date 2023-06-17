import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/design_system/atoms/logo.dart';
import 'package:my_app/design_system/cells/tab_bar.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class SerManosAppBar extends AppBar {
  final TabBar customTabBar;
  SerManosAppBar({
    super.key,
    required this.customTabBar,
  }) : super(
            title: const SerManosRectangleLogo(),
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: SerManosColorFoundations.statusBarColor),
            backgroundColor: SerManosColorFoundations.statusBarColor,
            bottom: PreferredSize(
              preferredSize: customTabBar.preferredSize,
              child: Material(
                color: SerManosColorFoundations.tabColor,
                child: customTabBar,
              ),
            ));
}
