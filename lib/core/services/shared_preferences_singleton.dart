import 'package:shared_preferences/shared_preferences.dart';
class Prefs {
  static late SharedPreferences _instance;

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value); // ✅ Future<void>
  }

  static Future<void> setInt(String key, int value) async {
    await _instance.setInt(key, value); // ✅
  }

  static Future<void> setString(String key, String value) async {
    await _instance.setString(key, value); // ✅
  }

  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }

  static int? getInt(String key) {
    return _instance.getInt(key);
  }

  static String? getString(String key) {
    return _instance.getString(key);
  }
}


