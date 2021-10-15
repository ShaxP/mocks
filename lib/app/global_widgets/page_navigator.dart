import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../state/navigation_controller.dart';
import '/globals.dart';

class PageNavigator {
  static void goto(Widget? view) {
    var viewController = Provider.of<NavigationController>(
        Globals.appKey.currentContext!,
        listen: false);
    viewController.currentView = view;
  }

  static Iterable<MaterialPage> get pages {
    var viewController = Provider.of<NavigationController>(
        Globals.appKey.currentContext!,
        listen: true);
    return viewController.views.map((view) => MaterialPage(child: view));
  }

  static bool get hasPages {
    var viewController = Provider.of<NavigationController>(
        Globals.appKey.currentContext!,
        listen: true);
    return viewController.isNotEmpty;
  }

  static void pop() {
    goto(null);
  }
}
