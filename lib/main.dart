import 'package:fcis2023/view/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'controller/authcontroller.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter(initialization);
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}
Future initialization(BuildContext? context)async {
  await Future.delayed(Duration(seconds:3));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}