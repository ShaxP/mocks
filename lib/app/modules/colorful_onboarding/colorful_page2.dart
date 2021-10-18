import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:mocks/app/global_widgets/gap.dart';

import '/globals.dart';
import 'local_widgets/colorful_page.dart';
import 'local_widgets/colorful_textfield.dart';

class ColorfulPage2 extends StatelessWidget {
  const ColorfulPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF4B9BC0);
    var fillColor = color.lighter(35);
    var textColor = color.darker(20);

    return ColorfulPage(
      color: color,
      title: 'Nice to meet you',
      subtitle: 'Just a few more details',
      currentPage: 2,
      pageCount: 3,
      image: 'images/bg2.png',
      children: [
        ColorfulTextField(
          fillColor: fillColor,
          textColor: textColor,
          label: "What's your firstname?",
        ),
        Gap.v(Globals.gap),
        ColorfulTextField(
          fillColor: fillColor,
          textColor: textColor,
          label: "What's your lastname?",
        ),
        Gap.v(Globals.gap),
        ColorfulTextField(
          fillColor: fillColor,
          textColor: textColor,
          label: "What's your occupation?",
        ),
      ],
      onAction: () {},
    );
  }
}
