import 'package:flutter/material.dart';

class SerManosSquareLogo extends StatelessWidget {
  const SerManosSquareLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      'assets/square_logo.png',
    );
    return logoImage;
  }
}

class SerManosRectangleLogo extends StatelessWidget {
  const SerManosRectangleLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      'assets/rectangular_logo.png',
    );
    return logoImage;
  }
}
