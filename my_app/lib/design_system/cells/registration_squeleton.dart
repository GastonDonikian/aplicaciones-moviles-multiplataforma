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
      body: SerManosGridPadding(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(image: AssetImage("assets/square_logo.png"), height: 150),
                            body,
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          footer,
                          const SizedBox(height: 44),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
