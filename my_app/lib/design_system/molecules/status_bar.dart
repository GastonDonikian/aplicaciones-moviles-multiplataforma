import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class SerManosStatusBar extends StatelessWidget {
  const SerManosStatusBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: SerManosColorFoundations.statusBarColor),
      ),
      body: body,
    );
  }
}

class SerManosWhiteStatusBar extends StatelessWidget {
  const SerManosWhiteStatusBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: SerManosColors.white),
      ),
      body: body,
    );
  }
}

class SerManosBlackStatusBar extends StatelessWidget {
  const SerManosBlackStatusBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: SerManosColors.black),
      ),
      body: body,
    );
  }
}
