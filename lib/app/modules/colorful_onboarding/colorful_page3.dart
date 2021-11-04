import 'package:flutter/material.dart';
import 'package:mocks/app/navigation/my_routes.dart';
import 'package:mocks/app/navigation/page_navigator.dart';
import '/app/global_widgets/gap.dart';

import '/globals.dart';
import '/app/global_widgets/colorful_page.dart';
import '/app/global_widgets/colorful_textfield.dart';

class ColorfulPage3 extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  const ColorfulPage3(
      {required this.animation, required this.secondaryAnimation, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bgGradient = LinearGradient(
      colors: [
        Color(0xFFfe9e8f),
        Color(0xFFcc604b),
        Color(0xFFfea295),
        Color(0xFFfdaea3),
      ],
      stops: [0.0, 0.4, 0.9, 1],
    );

    return ColorfulPage(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      heightPortion: 0.6,
      bgGradient: bgGradient,
      title: 'Complete your profile',
      subtitle: 'Just a few steps left to complete your profile',
      currentPage: 3,
      pageCount: 3,
      image: 'images/bg10.png',
      onRightAction: () {
        PageNavigator.goto(context, Routes.onboardingPage1);
      },
      onLeftAction: () {
        PageNavigator.pop(context);
      },
      children: [
        const ColorfulTextField(label: 'What year were you born?'),
        Gap.v(Globals.gap),
        const ColorfulTextField(label: 'What month were tyou born?'),
        Gap.v(Globals.gap),
        const ColorfulTextField(label: 'What day were you born?'),
      ],
    );
  }
}
