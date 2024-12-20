import 'package:ecommerce_flutter_web/core/locator.dart';
import 'package:ecommerce_flutter_web/firebase_options.dart';
import 'package:ecommerce_flutter_web/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await setupLocator();
  usePathUrlStrategy();
  
  runApp(const MyApp());
}
