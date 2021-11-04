import 'package:flutter/material.dart';
import 'package:mocks/app/navigation/my_routes.dart';

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
              page: Routes.landing, //TestPage(title: 'Page 1'),
            ),
            MenuEntry(
              title: 'Colorful Onboarding',
              subtitle:
                  'This is a colorful onboarding flow using glassmorphism',
              page: Routes.onboardingPage1, //ColorfulPage1(),
            ),
            MenuEntry(
              title: 'Colorful Onboarding Wizard',
              subtitle:
                  'This is a colorful wizard-based onboarding flow using glassmorphism',
              page: Routes.landing, //OnboardingColorfulWizard(),
            ),
          ],
        ),
      ),
    );
  }
}
