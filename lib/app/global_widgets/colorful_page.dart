import 'dart:math';

import 'package:flutter/material.dart';
import '/globals.dart';
import 'page_indicator.dart';
import '/app/global_widgets/gap.dart';
import '/app/global_widgets/frosty_glass.dart';

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
  final String? leftActionLabel;
  final void Function()? onLeftAction;
  final String? rightActionLabel;
  final void Function()? onRightAction;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  const ColorfulPage({
    this.textColor = const Color(0xFFFFFFFF),
    required this.bgGradient,
    required this.title,
    required this.subtitle,
    required this.currentPage,
    required this.pageCount,
    required this.image,
    required this.children,
    this.rightActionLabel = 'Next',
    required this.onRightAction,
    this.leftActionLabel = 'Back',
    required this.onLeftAction,
    this.heightPortion = 0.60,
    required this.animation,
    required this.secondaryAnimation,
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
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Image.asset(
                  image,
                  width: screenSize.width,
                  height: screenSize.height * 0.7,
                  fit: BoxFit.cover,
                ),
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
                      borderWidth: 6.0,
                      borderRadius: borderRadius,
                      // child:
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top:
                  screenSize.height * (1.0 - heightPortion) - viewInsets.bottom,
              child: SizedBox(
                width: screenSize.width,
                height: screenSize.height * heightPortion,
                child: Padding(
                  padding: const EdgeInsets.all(Globals.gap),
                  child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                                    begin: const Offset(1, 0),
                                    end: const Offset(0, 0))
                                .chain(CurveTween(curve: Curves.easeIn))
                                .animate(animation),
                            child: child,
                          );
                        },
                        child: Column(
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
                            ...children
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: Globals.gap),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                if (rightActionLabel != null)
                                  TextButton(
                                    onPressed: onLeftAction,
                                    child: Text(
                                      leftActionLabel!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                const Spacer(),
                                if (rightActionLabel != null)
                                  TextButton(
                                    onPressed: onRightAction,
                                    child: Text(
                                      rightActionLabel!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                              ],
                            ),
                            Gap.v(Globals.gap),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                child: SizedBox(
                  width: screenSize.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PageIndicator(
                        pageCount: pageCount,
                        currentPage: currentPage,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
