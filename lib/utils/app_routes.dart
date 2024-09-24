import 'package:bhagvad_geeta_app/screen/favorite/view/favorite_screen.dart';
import 'package:bhagvad_geeta_app/screen/home/view/home_screen.dart';
import 'package:bhagvad_geeta_app/screen/splash/view/splash_screen.dart';
import 'package:bhagvad_geeta_app/screen/verse/view/verse_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> app_routes = {
  "/": (context) => SplashScreen(),
  "home": (context) => HomeScreen(),
  "verse": (context) => VerseScreen(),
  "favorite": (context) => FavoriteScreen(),
};
