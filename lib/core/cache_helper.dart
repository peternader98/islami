import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> saveBool(String key, bool flag) async {
    return await prefs.setBool(key, flag);
  }

  static bool? getBool(String key) {
    return prefs.getBool(key);
  }

  static Future<bool> saveSurasList(int index) async {
    List<String> surasList = getSurasList() ?? [];
    surasList.remove(index.toString());
    surasList.add(index.toString());
    return await prefs.setStringList('surasList', surasList);
  }

  static List<String>? getSurasList() {
    return prefs.getStringList('surasList')?.toSet().toList() ?? [];
  }
}