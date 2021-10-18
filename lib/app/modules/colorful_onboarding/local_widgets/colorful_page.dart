import 'package:flutter/material.dart';
import 'package:flutter_color/flutter_color.dart';
import 'package:mocks/globals.dart';
import 'page_indicator.dart';
import '/app/global_widgets/gap.dart';
import 'frosty_glass.dart';

class ColorfulPage extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final int pageCount;
  final int currentPage;
  final String image;
  final double heightPortion;
  final List<Widget> children;
  final String actionLabel;
  final void Function()? onAction;
  const ColorfulPage({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.pageCount,
    required this.image,
    required this.children,
    this.actionLabel = 'Next',
    required this.onAction,
    this.heightPortion = 0.62,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var textColor = color.darker(40);

    var borderRadius = const BorderRadius.vertical(
      top: Radius.circular(60),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      title,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 30,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                Gap.v(8),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      subtitle,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: screenSize.height * (1.0 - heightPortion),
            child: FrostyGlass(
              width: screenSize.width,
              height: screenSize.height * heightPortion,
              borderRadius: borderRadius,
              child: Padding(
                padding: const EdgeInsets.all(Globals.gap),
                child: Column(
                  children: [
                    // Gap.v(Globals.gap),
                    // ColorfulTextField(
                    //   fillColor: fillColor,
                    //   textColor: textColor,
                    //   label: 'What is your email address?',
                    // ),
                    // Gap.v(Globals.gap),
                    // ColorfulTextField(
                    //   fillColor: fillColor,
                    //   textColor: textColor,
                    //   label: 'Choose a password',
                    //   isPassword: true,
                    // ),
                    // Gap.v(Globals.gap),
                    // ColorfulTextField(
                    //   fillColor: fillColor,
                    //   textColor: textColor,
                    //   label: 'Confirm password',
                    //   isPassword: true,
                    // ),
                    ...children,
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Globals.gap),
                      child: Row(
                        children: [
                          PageIndicator(
                            pageCount: pageCount,
                            currentPage: currentPage,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: onAction,
                            child: Text(
                              actionLabel,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
