import 'package:flutter/material.dart';

import '../../../utils/jsonHelper.dart';
import '../model/verse_model.dart';
class VerseProvider with ChangeNotifier
{
  List<VerseModel> allVerseList =[];
  void getJson() async
  {
    allVerseList = await JsonHelper.helper.verseJason();
    notifyListeners();
  }
}