import 'package:bhagvad_geeta_app/utils/jsonHelper.dart';
import 'package:flutter/material.dart';

import '../model/chapter_model.dart';
class HomeProvider with ChangeNotifier
{
  List<ChapterModel> chapterList = [];

  void getJson() async
  {
    // JsonHelper helper = JsonHelper();
    chapterList = await JsonHelper.helper.chapterJson();
    notifyListeners();
  }
}