import 'package:tasty_dinery/features/authentication/screens/1_onboarding/onboarding_view.dart';
import 'package:tasty_dinery/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: CcTheme.lightTheme,
        // darkTheme: CcTheme.darkTheme,
        home: const OnboardingView()

        // enable one time onboarding screen.....uncomment the code below

        // NavigationMenu can be replaced by sign in and when sign in is only once.... go directly to NavigationMenu

        // home: onboarding ? const NavigationMenu() : const OnboardingView(),

        // else remove all the async in main, myapp, onboarding_view with their respect values
        );
  }
}
