
import 'package:bhagvad_geeta_app/screen/home/view/home_screen.dart';
import 'package:bhagvad_geeta_app/screen/verse/view/verse_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "verse":(context) => VerseScreen(),
};