import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';

class SerManosTab extends StatelessWidget {
  const SerManosTab({super.key, required this.tabText});

  final String tabText;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Align(
        alignment: Alignment.center,
        child: SerManosTexts.button(tabText),
      ),
    );
  }
}
