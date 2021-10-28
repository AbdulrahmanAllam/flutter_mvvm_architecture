import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesServices {

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();

  static Future<bool> setInt({required String key, required int value}) async {
    final prefs = await _prefs;
    return prefs.setInt(key, value);
  }

  static Future<int?> getInt({required String key}) async {
    final prefs = await _prefs;
    return prefs.getInt(key);
  }

  static Future<bool> setString({required String key, required String value}) async {
    final prefs = await _prefs;
    return prefs.setString(key, value);
  }

  static Future<String?> getString({required String key}) async {
    final prefs = await _prefs;
    return prefs.getString(key);
  }

  static void reload() async {
    final prefs = await _prefs;
    prefs.reload();
  }

  static Future<bool> remove({required String key}) async {
    final prefs = await _prefs;
    return prefs.remove(key);
  }

  static Future<bool> clear() async {
    final prefs = await _prefs;
    return prefs.clear();
  }
}
