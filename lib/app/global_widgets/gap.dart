import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  const Gap({Key? key, this.height = 0, this.width = 0}) : super(key: key);
  final double height;
  final double width;

  static Gap v(double size) => Gap(
        height: size,
      );

  static Gap h(double size) => Gap(
        width: size,
      );

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: height,
      );
}
