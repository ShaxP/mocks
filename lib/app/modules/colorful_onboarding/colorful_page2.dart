import 'package:flutter/material.dart';
import 'package:mocks/app/navigation/my_routes.dart';
import 'package:mocks/app/navigation/page_navigator.dart';
import '/app/global_widgets/gap.dart';

import '/globals.dart';
import '/app/global_widgets/colorful_page.dart';
import '/app/global_widgets/colorful_textfield.dart';

class ColorfulPage2 extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  const ColorfulPage2({
    required this.animation,
    required this.secondaryAnimation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bgGradient =
        LinearGradient(colors: [Color(0xFF408fb8), Color(0xFF4894b7)]);

    return ColorfulPage(
      animation: animation,
      secondaryAnimation: secondaryAnimation,
      heightPortion: 0.55,
      bgGradient: bgGradient,
      title: 'Nice to meet you',
      subtitle: 'Just a few more details',
      currentPage: 2,
      pageCount: 3,
      image: 'images/bg2.png',
      children: [
        const ColorfulTextField(
          label: "What's your firstname?",
        ),
        Gap.v(Globals.gap),
        const ColorfulTextField(
          label: "What's your lastname?",
        ),
        Gap.v(Globals.gap),
        const ColorfulTextField(
          label: "What's your occupation?",
        ),
      ],
      onRightAction: () {
        PageNavigator.goto(context, Routes.onboardingPage3);
      },
      onLeftAction: () {
        PageNavigator.pop(context);
      },
    );
  }
}
