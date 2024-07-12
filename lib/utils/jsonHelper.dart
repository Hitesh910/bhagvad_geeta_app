import 'dart:convert';

import 'package:bhagvad_geeta_app/screen/home/model/chapter_model.dart';
import 'package:bhagvad_geeta_app/screen/verse/model/verse_model.dart';
import 'package:flutter/services.dart';

class JsonHelper
{
  static JsonHelper helper = JsonHelper._();
  JsonHelper._();

  Future<List<ChapterModel>> chapterJson() async {
    var jsonString = await rootBundle.loadString("assets/json/chapters.json");
    List json = jsonDecode(jsonString);
    List<ChapterModel> chapterList =  json.map((e) => ChapterModel.mapToModel(e)).toList();
    return chapterList;
  }

  Future<List<VerseModel>> verseJason() async {
    var jsonString = await rootBundle.loadString("assets/json/verse.json");
    List json = jsonDecode(jsonString);
    List<VerseModel> verseList = json.map((e) => VerseModel.mapToModel(e)).toList();
    return verseList;
  }
}