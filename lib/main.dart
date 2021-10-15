import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/modules/mock_app.dart';
import 'app/state/navigation_controller.dart';
import 'globals.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: NavigationController()),
      ],
      child: MocksApp(
        key: Globals.appKey,
      ),
    ),
  );
}
