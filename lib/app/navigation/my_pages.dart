import 'package:flutter/material.dart';
import 'package:mocks/app/modules/colorful_onboarding/colorful_page1.dart';
import 'package:mocks/app/modules/colorful_onboarding/colorful_page2.dart';
import 'package:mocks/app/modules/colorful_onboarding/colorful_page3.dart';
import 'package:mocks/app/modules/landing/landing_page.dart';
import 'package:mocks/app/navigation/my_routes.dart';

class AppPages {
  static final Map<String,
          Widget Function(BuildContext, Animation<double>, Animation<double>)>
      routes = {
    Routes.landing: (context, animation, secondaryAnimation) =>
        const LandingPage(),
    Routes.onboardingPage1: (context, animation, secondaryAnimation) =>
        ColorfulPage1(
            animation: animation, secondaryAnimation: secondaryAnimation),
    Routes.onboardingPage2: (context, animation, secondaryAnimation) =>
        ColorfulPage2(
            animation: animation, secondaryAnimation: secondaryAnimation),
    Routes.onboardingPage3: (context, animation, secondaryAnimation) =>
        ColorfulPage3(
            animation: animation, secondaryAnimation: secondaryAnimation),
  };
}
