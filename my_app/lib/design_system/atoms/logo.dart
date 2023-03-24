import 'package:flutter/material.dart';

class SerManosSquareLogo extends StatelessWidget {
  final String path = '../assets/';
  final double widthImage;

  const SerManosSquareLogo({
    Key? key,
    required this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      path,
      width: widthImage,
      height: widthImage,
    );
    return logoImage;
  }
}

class SerManosRectangleLogo extends StatelessWidget {
  final String path = '../assets/rectangular_logo';
  final double widthImage;

  const SerManosRectangleLogo({
    Key? key,
    required this.widthImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget logoImage = Image.asset(
      path,
      width: widthImage,
      height: widthImage,
    );
    return logoImage;
  }
}
