import 'dart:ui';

import 'package:flutter/material.dart';

class FrostyGlass extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final Widget? child;
  const FrostyGlass({
    this.width,
    this.height,
    this.borderRadius,
    this.child,
    this.borderWidth = 1.5,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(
          width: 1.5,
          color: Colors.white.withOpacity(0.35),
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 42, sigmaY: 42),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white10,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
