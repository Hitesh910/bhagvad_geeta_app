import 'package:bhagvad_geeta_app/utils/helper/shared_helper.dart';
import 'package:bhagvad_geeta_app/utils/jsonHelper.dart';
import 'package:flutter/material.dart';

import '../../verse/model/verse_model.dart';
import '../model/chapter_model.dart';
class HomeProvider with ChangeNotifier
{
  List<ChapterModel> chapterList = [];
  int selectedIndex = 0;
  List<VerseModel> allVerseList =[];
  List<VerseModel> filterList = [];
  String? theme;
  SharedHelper share = SharedHelper();


  void getJson() async
  {
    // JsonHelper helper = JsonHelper();
    chapterList = await JsonHelper.helper.chapterJson();
    notifyListeners();
    print(chapterList);
  }

  void changeIndex(int index)
  {
    selectedIndex = index;
    notifyListeners();
  }

  void getJson2() async
  {
    allVerseList = await JsonHelper.helper.verseJason();
    notifyListeners();
  }

  void selectedList(int? chapterNumber)
  {
    getJson2();
    int i=0;
    filterList.clear();
    for(i=0; i < allVerseList.length;i++)
      {
        if(allVerseList[i].chapter_number == chapterNumber)
          {
            filterList.add(allVerseList[i]);
          }
      }
    notifyListeners();
  }

  void setTheme(String theme)
  {
    share.setTheme(theme);
    notifyListeners();
  }

  Future<void> getTheme()
  async {
    theme = await share.getTheme();
    notifyListeners();
  }

  void changSwitch(bool check)
  {}
}



