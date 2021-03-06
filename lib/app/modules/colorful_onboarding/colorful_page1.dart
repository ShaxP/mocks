import 'package:flutter/material.dart';
import 'package:mocks/app/navigation/my_routes.dart';
import 'package:mocks/app/navigation/page_navigator.dart';

import '/app/global_widgets/gap.dart';
import '/app/global_widgets/colorful_page.dart';
import '/globals.dart';
import '/app/global_widgets/colorful_textfield.dart';

class ColorfulPage1 extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  const ColorfulPage1({
    required this.animation,
    required this.secondaryAnimation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bgGradient =
        LinearGradient(colors: [Color(0xFFf699ae), Color(0xFFcf6a7c)]);

    return ColorfulPage(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      heightPortion: 0.65,
      bgGradient: bgGradient,
      title: 'Welcome to Rndevu',
      subtitle: "We'd like to know more about you",
      currentPage: 1,
      pageCount: 3,
      image: 'images/bg11.png',
      children: [
        const ColorfulTextField(
          label: 'What is your email address?',
        ),
        Gap.v(Globals.gap),
        const ColorfulTextField(
          label: 'Choose a password',
          isPassword: true,
        ),
        Gap.v(Globals.gap),
        const ColorfulTextField(
          label: 'Confirm password',
          isPassword: true,
        ),
      ],
      onRightAction: () {
        PageNavigator.goto(context, Routes.onboardingPage2);
      },
      onLeftAction: () {
        PageNavigator.pop(context);
      },
    );
  }
}
