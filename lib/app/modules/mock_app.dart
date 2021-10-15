import 'package:flutter/material.dart';

import '/app/global_widgets/page_navigator.dart';
import 'landing/landing_page.dart';

class MocksApp extends StatelessWidget {
  const MocksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var navigationController = Provider.of<NavigationController>(context);
    debugPrint('Building MyApp');
    return MaterialApp(
      title: 'Showcases',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Navigator(
        pages: [
          const MaterialPage(
            child: LandingPage(),
          ),
          if (PageNavigator.hasPages) ...PageNavigator.pages,
        ],
        onPopPage: (route, result) {
          PageNavigator.pop();
          return route.didPop(result);
        },
      ),
    );
  }
}
