import 'package:flutter/material.dart';

import 'page_navigator.dart';

class MenuEntry extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget page;
  const MenuEntry({
    required this.title,
    this.subtitle,
    required this.page,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subtitleWidget = subtitle == null ? null : Text(subtitle!);
    return ListTile(
      title: Text(title),
      subtitle: subtitleWidget,
      onTap: () {
        PageNavigator.goto(page);
        // Provider.of<ViewController>(context, listen: false).currentView = page;
      },
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
