import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/app/state/view_controller.dart';

class MenuEntry extends StatelessWidget {
  final String title;
  final Widget page;
  const MenuEntry({
    required this.title,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
      onTap: () {
        Provider.of<ViewController>(context, listen: false).currentView = page;
      },
    );
  }
}
