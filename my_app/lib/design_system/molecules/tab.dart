import 'package:flutter/material.dart';
import 'package:my_app/design_system/foundations/colors.dart';

class SerManosTab extends StatelessWidget {
  const SerManosTab({super.key, required this.tabText});

  final Color defaultColor = SerManosColorFoundations.tabColor;
  final Color selectedColor = SerManosColorFoundations.tabSelectedColor;
  final String tabText;

  @override
  Widget build(BuildContext context) {
    return Container(color: defaultColor, child: Tab(text: tabText));
  }
}
