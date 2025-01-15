import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OfflineStorage {
  static Future<void> saveData(String key, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(data));
  }

  static Future<Map<String, dynamic>?> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    if (data != null) {
      return json.decode(data);
    }
    return null;
  }

  static Future<void> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
