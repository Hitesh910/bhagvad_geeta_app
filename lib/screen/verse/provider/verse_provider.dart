import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../utils/jsonHelper.dart';
import '../model/verse_model.dart';
class VerseProvider with ChangeNotifier
{
  List<VerseModel> allVerseList =[];
  FlutterTts flutterTts = FlutterTts();
  void getJson() async
  {
    allVerseList = await JsonHelper.helper.verseJason();
    notifyListeners();
  }

}


