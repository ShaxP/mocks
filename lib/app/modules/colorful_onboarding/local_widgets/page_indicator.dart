import 'package:flutter/material.dart';
import '/app/global_widgets/gap.dart';

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final double dotSize;
  const PageIndicator({
    required this.pageCount,
    this.currentPage = 1,
    this.dotSize = 10.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots(),
    );
  }

  List<Widget> dots() {
    var dots = <Widget>[];

    for (var i = 1; i <= pageCount; i++) {
      var dot = i == currentPage ? currentPageDot() : greyDot();
      dots.add(dot);
      if (i != pageCount) {
        dots.add(Gap.h(dotSize));
      }
    }
    return dots;
  }

  Widget currentPageDot() => Container(
        height: dotSize,
        width: dotSize,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );

  Widget greyDot() {
    return Container(
      height: dotSize,
      width: dotSize,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        shape: BoxShape.circle,
      ),
    );
  }
}
