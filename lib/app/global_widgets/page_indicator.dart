import 'package:flutter/material.dart';
import '/app/global_widgets/gap.dart';

class PageIndicator extends StatelessWidget {
  final int pageCount;
  final int currentPage;
  final double dotSize;
  final double currentDotsize;
  const PageIndicator({
    required this.pageCount,
    this.currentPage = 1,
    this.currentDotsize = 30.0,
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
      var dot = i == currentPage ? currentPageDot(i) : greyDot(i);
      dots.add(dot);
      if (i != pageCount) {
        dots.add(Gap.h(dotSize));
      }
    }
    return dots;
  }

  Widget currentPageDot(int index) => Hero(
        tag: 'page_indicator_dot_$index',
        child: Container(
          height: dotSize,
          width: currentDotsize,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(currentDotsize / 2),
          ),
        ),
      );

  Widget greyDot(int index) {
    return Hero(
      tag: 'page_indicator_dot_$index',
      child: Container(
        height: dotSize,
        width: dotSize,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
