import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasty_dinery/data/repositories/authentication/authentication_repository.dart';
import 'package:tasty_dinery/firebase_options.dart';
import 'package:tasty_dinery/myapp.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // add widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // getx local storage
  await GetStorage.init();

  // await native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // initialize firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
