import 'dart:convert';
import 'package:flutter/services.dart';

class OfflineStorage {
  static Future<List<dynamic>> loadOfflineData() async {
    final String response = await rootBundle.loadString('assets/offline_data.json');
    return json.decode(response);
  }
}
