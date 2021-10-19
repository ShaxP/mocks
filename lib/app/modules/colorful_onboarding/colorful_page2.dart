import 'package:flutter/material.dart';
import 'package:mocks/app/global_widgets/gap.dart';

import '/globals.dart';
import 'local_widgets/colorful_page.dart';
import 'local_widgets/colorful_textfield.dart';

class ColorfulPage2 extends StatelessWidget {
  const ColorfulPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bgGradient =
        LinearGradient(colors: [Color(0xFF408fb8), Color(0xFF4894b7)]);

    return ColorfulPage(
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
      onAction: () {},
    );
  }
}
