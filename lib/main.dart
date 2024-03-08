import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasty_dinery/myapp.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;

//

  // add widgets binding

  // init local storage

  // await native splash

  // initializa firebase

  // initialize authentication

  runApp(MyApp(onboarding: onboarding));
}
