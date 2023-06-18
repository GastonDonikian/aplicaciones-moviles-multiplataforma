import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/tokens/colors.dart';

class SerManosStatusBar extends StatelessWidget {
  const SerManosStatusBar(
      {super.key, required this.body, this.leading, this.title});

  final Widget body;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: leading == null ? 0 : kToolbarHeight,
        backgroundColor: SerManosColorFoundations.statusBarColor,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: SerManosColorFoundations.statusBarColor),
        leading: leading,
        centerTitle: true,
        title: title,
      ),
      body: body,
    );
  }
}

class SerManosWhiteStatusBar extends StatelessWidget {
  const SerManosWhiteStatusBar(
      {super.key, required this.body, this.leading, this.title});

  final Widget body;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: leading == null ? 0 : kToolbarHeight,
        backgroundColor: SerManosColors.white,
        elevation: 0,
        shadowColor: null,
        centerTitle: true,
        systemOverlayStyle:
            SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
        leading: leading,
        title: title,
      ),
      body: body,
    );
  }
}

class SerManosBlackStatusBar extends StatelessWidget {
  const SerManosBlackStatusBar(
      {super.key, required this.body, this.leading, this.title});

  final Widget body;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: leading == null ? 0 : kToolbarHeight,
        backgroundColor: SerManosColors.black,
        elevation: 0,
        leading: leading,
        title: title,
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: SerManosColors.black),
      ),
      body: body,
    );
  }
}
