import 'package:shared_preferences/shared_preferences.dart';

// class Prefs {
//   static late SharedPreferences _instance;

//   static Future<void> init() async {
//     _instance = await SharedPreferences.getInstance();
//   }

//   static setBool(String key, bool value) async {
//     return await _instance.setBool(key, value);
//   }

//   static bool getBool(String key) {
//     return _instance.getBool(key) ?? false;
//   }


// Prefs.setInt('patient_id', state.user.patientId);

// Prefs.setString('token', token);


// }


// --------------------------------------------------
// CHAAAAAAAAAT GGGGBBBT


// class Prefs {
//   static late SharedPreferences _instance;

//   /// يجب استدعاؤها في `main()` مرة واحدة
//   static Future<void> init() async {
//     _instance = await SharedPreferences.getInstance();
//   }

//   // ---- Bool ----
//   static Future<bool> setBool(String key, bool value) async {
//     return await _instance.setBool(key, value);
//   }

//   static bool getBool(String key) {
//     return _instance.getBool(key) ?? false;
//   }

//   // ---- Int ----
//   static Future<bool> setInt(String key, int value) async {
//     return await _instance.setInt(key, value);
//   }

//   static int? getInt(String key) {
//     return _instance.getInt(key);
//   }

//   // ---- String ----
//   static Future<bool> setString(String key, String value) async {
//     return await _instance.setString(key, value);
    
//   }

//   static String? getString(String key) {
//     return _instance.getString(key);
    
//   }

//   // ---- Remove (اختياري) ----
//   static Future<bool> remove(String key) async {
//     return await _instance.remove(key);
//   }

//   // ---- Clear All (اختياري) ----
//   static Future<bool> clear() async {
//     return await _instance.clear();
//   }
// }



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


