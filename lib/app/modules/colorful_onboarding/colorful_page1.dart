import 'package:flutter/material.dart';
import 'package:mocks/app/global_widgets/page_navigator.dart';
import 'package:mocks/app/modules/colorful_onboarding/colorful_page2.dart';

import '/app/global_widgets/gap.dart';
import '/app/modules/colorful_onboarding/local_widgets/colorful_page.dart';
import '/globals.dart';
import 'local_widgets/colorful_textfield.dart';

class ColorfulPage1 extends StatelessWidget {
  const ColorfulPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bgGradient =
        LinearGradient(colors: [Color(0xFFf699ae), Color(0xFFcf6a7c)]);

    return ColorfulPage(
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
      onAction: () {
        PageNavigator.goto(const ColorfulPage2());
      },
    );
  }
}
