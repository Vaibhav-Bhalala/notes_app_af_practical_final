import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_practical_test_af/modules/View/favorite_screen.dart';
import 'package:notes_app_practical_test_af/modules/View/home_screen.dart';

import 'modules/View/splash_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepOrangeAccent,
    ),
    getPages: [
      GetPage(
        name: '/',
        page: () => splashScreen(),
      ),
      GetPage(
        name: '/home',
        page: () => HomeScreen(),
      ),
      GetPage(
        name: '/favorite',
        page: () => FavoriteScreen(),
      ),
    ],
  ));
}
