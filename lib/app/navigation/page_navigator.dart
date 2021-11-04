import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mocks/app/navigation/my_routes.dart';

import 'my_pages.dart';

class PageNavigator {
  static void goto(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routeName = Routes.landing;
    if (settings.name != null && AppPages.routes[settings.name] != null) {
      routeName = settings.name!;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return AppPages.routes[routeName]!(
            context, animation, secondaryAnimation);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      settings: settings,
    );
  }
}
