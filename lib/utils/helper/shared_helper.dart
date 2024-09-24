import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper
{
  void setTheme(String mode)
  async
  {
    SharedPreferences sha = await SharedPreferences.getInstance();
    //sha.setBool('theme', true);
    sha.setString('theme', mode);

  }

  Future<String?> getTheme()
  async
  {
    SharedPreferences sha =await SharedPreferences.getInstance();
   // bool? value = sha.getBool('theme');
    String? theme = sha.getString('theme');
    return theme;
    // // print(value);
    // return value;
  }

  Future<void> setVerse(List<String> verseList)
  async {
    SharedPreferences sha =await SharedPreferences.getInstance();
    sha.setStringList('list', verseList);
    print(verseList);
  }

  Future<List<String>?> getVerse()
  async {
    SharedPreferences sha =await SharedPreferences.getInstance();
    List<String>? verseList =  sha.getStringList('list');
    print(verseList);
    return verseList;
  }
}