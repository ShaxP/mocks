import 'package:flutter/material.dart';
import 'package:mocks/app/navigation/my_routes.dart';
import 'package:mocks/app/navigation/page_navigator.dart';

class MocksApp extends StatelessWidget {
  const MocksApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Showcases',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: Routes.landing,
      onGenerateRoute: PageNavigator.generateRoute,
    );
  }
}
