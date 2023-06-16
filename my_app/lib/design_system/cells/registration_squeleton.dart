import 'package:flutter/material.dart';
import 'package:my_app/design_system/molecules/status_bar.dart';
import 'package:my_app/design_system/tokens/grid_padding.dart';

class RegistrationLayout extends StatelessWidget {
  const RegistrationLayout({
    super.key,
    required this.body,
    required this.footer,
  });

  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return SerManosWhiteStatusBar(
      body: SafeArea(
        child: SerManosGridPadding(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage("assets/square_logo.png")),
                    body,
                  ],
                ),
              ),
              footer
            ],
          ),
        ),
      ),
    );
  }
}
