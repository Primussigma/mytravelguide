import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(GetMaterialApp(
      home: HomeScreen(title: 'MyTravelGuide'),
      debugShowCheckedModeBanner: false));
}
