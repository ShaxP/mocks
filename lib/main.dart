import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/global_widgets/menu_entry.dart';
import 'app/global_widgets/test_page.dart';
import 'app/state/view_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ViewController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('Building MyApp');
    var viewController = Provider.of<ViewController>(context);
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
          if (viewController.isNotEmpty)
            ...viewController.views.map((view) => MaterialPage(child: view))
        ],
        onPopPage: (route, result) {
          viewController.currentView = null;
          return route.didPop(result);
        },
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showcases'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            MenuEntry(
              title: 'Page1',
              page: TestPage(title: 'Page 1'),
            ),
            MenuEntry(
              title: 'Page2',
              page: TestPage(title: 'Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
