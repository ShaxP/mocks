import 'package:flutter/material.dart';

import 'local_widgets/frosty_glass.dart';

class ColorfulPage1 extends StatelessWidget {
  const ColorfulPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var borderRadius = const BorderRadius.vertical(
      top: Radius.circular(60),
    );
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/bg1.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: screenSize.height * 0.35,
            child: FrostyGlass(
              width: screenSize.width,
              height: screenSize.height * 0.65,
              borderRadius: borderRadius,
            ),
          ),
        ],
      ),
    );
  }
}
