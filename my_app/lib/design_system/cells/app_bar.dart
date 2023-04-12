import 'package:flutter/material.dart';
import 'package:my_app/design_system/cells/tab_bar.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class SerManosAppBar extends AppBar {
  final TabBar customTabBar;
  SerManosAppBar({
    super.key,
    required this.customTabBar,
  }) : super(
            backgroundColor: SerManosColorFoundations.statusBarColor,
            bottom: PreferredSize(
              preferredSize: customTabBar.preferredSize,
              child: Material(
                color: SerManosColorFoundations.tabColor, //<-- SEE HERE
                child: customTabBar,
              ),
            ));
}
