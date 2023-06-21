import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
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
            systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: SerManosColorFoundations.statusBarColor),
            backgroundColor: SerManosColorFoundations.statusBarColor,
            bottom: PreferredSize(
              preferredSize: customTabBar.preferredSize,
              child: Material(
                color: SerManosColorFoundations.tabColor,
                child: customTabBar,
              ),
            ));
}

class SerManosOpacityAppBar extends AppBar {
  final Widget leading;
  SerManosOpacityAppBar({
    super.key,
    required this.leading,
  }) : super(
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
            leading: leading);
}
