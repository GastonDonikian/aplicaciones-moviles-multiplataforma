import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class SerManosStatusBar extends StatelessWidget {
  const SerManosStatusBar({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: SerManosColorFoundations.statusBarColor),
      ),
      body: body,
    );
  }
}
