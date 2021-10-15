import 'package:flutter/material.dart';

import '/app/global_widgets/test_page.dart';
import '/app/global_widgets/menu_entry.dart';

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
              subtitle: 'This is the first test page',
              page: TestPage(title: 'Page 1'),
            ),
            MenuEntry(
              title: 'Page2',
              subtitle: 'This is the second test page',
              page: TestPage(title: 'Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}
