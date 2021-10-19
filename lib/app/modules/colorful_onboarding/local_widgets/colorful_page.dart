import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mocks/globals.dart';
import 'page_indicator.dart';
import '/app/global_widgets/gap.dart';
import 'frosty_glass.dart';

class ColorfulPage extends StatelessWidget {
  final Color? textColor;
  final Gradient bgGradient;
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
    this.textColor = const Color(0xFFFFFFFF),
    required this.bgGradient,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.pageCount,
    required this.image,
    required this.children,
    this.actionLabel = 'Next',
    required this.onAction,
    this.heightPortion = 0.60,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var viewInsets = MediaQuery.of(context).viewInsets;
    debugPrint('viewInsets: $viewInsets');

    var borderRadius = const BorderRadius.vertical(
      top: Radius.circular(60),
    );
    return Container(
      decoration: BoxDecoration(gradient: bgGradient),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0.0,
              child: Image.asset(
                image,
                width: screenSize.width,
                height: screenSize.height * 0.7,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: max(
                          0,
                          screenSize.height * (1.0 - heightPortion) -
                              viewInsets.bottom),
                    ),
                    FrostyGlass(
                      width: screenSize.width,
                      height: screenSize.height * heightPortion,
                      borderRadius: borderRadius,
                      child: Padding(
                        padding: const EdgeInsets.all(Globals.gap),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      title,
                                      style: TextStyle(
                                          color: textColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                Gap.v(Globals.gap),
                              ],
                            ),
                            ...children,
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Globals.gap),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
