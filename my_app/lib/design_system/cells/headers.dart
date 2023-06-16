import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/design_system/atoms/icons.dart';
import 'package:my_app/design_system/foundations/colors.dart';
import 'package:my_app/design_system/foundations/texts.dart';
import 'package:my_app/design_system/molecules/status_bar.dart';

class SerManosWhiteHeader extends StatelessWidget {
  const SerManosWhiteHeader({super.key, required this.body, this.title});

  final Widget body;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return SerManosWhiteStatusBar(
      body: body,
      title: title,
      leading: IconButton(
        icon: const Icon(
          SerManosIcons.closeIcon,
          color: SerManosColorFoundations.buttonEnabledColor,
        ),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class SerManosSectionHeader extends StatelessWidget {
  const SerManosSectionHeader({super.key, required this.body, this.title});

  final Widget body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return SerManosStatusBar(
      body: body,
      title: title == null
          ? null
          : SerManosTexts.subtitle1(
              title!,
              color: SerManosColorFoundations.defaultTextColor,
              textAlign: TextAlign.center,
            ),
      leading: IconButton(
        icon: const Icon(
          SerManosIcons.backIcon,
          color: SerManosColorFoundations.sectionHeaderIconColor,
        ),
        onPressed: () => context.pop(),
      ),
    );
  }
}
