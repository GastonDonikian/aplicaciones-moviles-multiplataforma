import 'package:flutter/material.dart';

class SerManosSquareLogo extends StatelessWidget {
  final double widthImage;

  const SerManosSquareLogo({
    Key? key,
    required this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      'assets/square_logo.jpeg',
      width: widthImage,
      height: widthImage,
    );
    return logoImage;
  }
}

class SerManosRectangleLogo extends StatelessWidget {
  final double widthImage;
  final double heightImage;

  const SerManosRectangleLogo({
    Key? key,
    required this.widthImage,
    required this.heightImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      'assets/rectangular_logo.jpeg',
      width: widthImage,
      height: heightImage,
    );
    return logoImage;
  }
}
