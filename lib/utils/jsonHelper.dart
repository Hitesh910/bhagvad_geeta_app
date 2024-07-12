import 'dart:convert';

import 'package:bhagvad_geeta_app/screen/home/model/chapter_model.dart';
import 'package:flutter/services.dart';

class JsonHelper
{
  static JsonHelper helper = JsonHelper._();
  JsonHelper._();

  Future<List<ChapterModel>> chapterJson() async {
    var jsonString = rootBundle.loadString("assets/json/chapter.json");
    List json = jsonDecode(jsonString as String);
    List<ChapterModel> chapterList =  json.map((e) => ChapterModel.mapToModel(e)).toList();
    return chapterList;
  }
}