import 'dart:math';

import 'package:bhagvad_geeta_app/utils/helper/shared_helper.dart';
import 'package:bhagvad_geeta_app/utils/jsonHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../verse/model/verse_model.dart';
import '../model/chapter_model.dart';

class HomeProvider with ChangeNotifier {
  List<ChapterModel> chapterList = [];
  int selectedIndex = 0;
  List<VerseModel> allVerseList = [];
  List<VerseModel> filterList = [];
  FlutterTts flutterTts = FlutterTts();

  // bool? theme;
  String? theme;
  SharedHelper share = SharedHelper();
  int i = 0;
  List<String> verseList = [];
  bool isLike = false;
  SharedHelper helper = SharedHelper();

  void getJson() async {
    // JsonHelper helper = JsonHelper();
    chapterList = await JsonHelper.helper.chapterJson();
    randomVerse();
    notifyListeners();
    print(chapterList);
  }

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void getJson2() async {
    allVerseList = await JsonHelper.helper.verseJason();
    //randomVerse();
    notifyListeners();
  }

  void selectedList(int? chapterNumber) {
    getJson2();
    int i = 0;
    filterList.clear();
    for (i = 0; i < allVerseList.length; i++) {
      if (allVerseList[i].chapter_number == chapterNumber) {
        filterList.add(allVerseList[i]);
      }
    }
    notifyListeners();
  }

  void setTheme(String value) {
    share.setTheme(value);
    notifyListeners();
    print(value);
  }

  Future<void> getTheme() async {
    theme = await share.getTheme();
    notifyListeners();
    // print(theme);
  }

  // void changSwitch(bool check)
  // {}

  void randomVerse() {
    Random r1 = Random();
    i = r1.nextInt(allVerseList.length);
    notifyListeners();
  }

  void verseSave(String verse) {
    isLike = !isLike;
    verseList.add(verse);
    share.setVerse(verseList);
    notifyListeners();
    print(verse);
  }

  void verseSave2() {
    isLike = !isLike;
    // verseList.add(verse);
    // share.setVerse(verseList);
    notifyListeners();
    // print(verse);
  }

  void setVerse1() {}

  Future<void> getVerse1() async {
    var list = share.getVerse();

    // if(list != null)
    //   {
    //     verseList = list as List<String>;
    //   }
    if (await share.getVerse() == null) {
      verseList = [];
      print(verseList);
    } else {
      verseList = (await share.getVerse())!;
    }
  }

  Future<void> flutterTtsspeak() async {
    // await flutterTts.speak("hello world");
    var result = await flutterTts.speak("ધર્મક્ષેત્રે કુરુક્ષેત્રે સમવેતા યુયુત્સવઃ |મામકાઃ પાંડવાશ્ચૈવ કિમકુર્વત સંજય || 1 ||");
    if (result == 1)
      {
        print("================== PLaying");
      }
    else
      {
        print("================== No PLaying");

      }
    await flutterTts.setLanguage("guj-IND");

    await flutterTts.setSpeechRate(0.5);

    await flutterTts.setVolume(0.5);

    await flutterTts.setPitch(1.0);

    await flutterTts.isLanguageAvailable("guj-IND");

  }
    // await flutterTts.setLanguage("en-US");

    // await flutterTts.setSpeechRate(1.0);

    // await flutterTts.setVolume(5.0);

    // await flutterTts.setPitch(1.0);

    // await flutterTts.isLanguageAvailable("en-US");

}
