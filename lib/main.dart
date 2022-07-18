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
  await Future.delayed(Duration(milliseconds: 1000));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(size: 30,color: Colors.teal),
        primarySwatch: Colors.teal,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            )
          )
        ),
        fontFamily: 'OpenSans',
        textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold,color: Colors.teal),
      headline2: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight: FontWeight.w600),
      headline3: TextStyle(fontSize: 18.0,color: Colors.white),
      headline6: TextStyle(fontSize: 13.0,color:Colors.white70),
      bodyText1: TextStyle(fontSize: 20.0,color:Colors.black54),
      bodyText2: TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)

    ),
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}