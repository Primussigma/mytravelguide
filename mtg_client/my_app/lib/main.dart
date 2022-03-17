import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/bindings/authBinding.dart';
import 'package:my_app/firebase_options.dart';
import 'package:my_app/screens/home/home_screen.dart';
import 'package:my_app/screens/login/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GetMaterialApp(
      home: HomeScreen(),
      initialBinding: AuthBinding(),
      debugShowCheckedModeBanner: false));
}
