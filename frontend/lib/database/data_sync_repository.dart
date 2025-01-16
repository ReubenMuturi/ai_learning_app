import 'dart:convert';
import 'package:http/http.dart' as http;

class DataSyncRepository {
  final String apiUrl = 'https://example.com/sync';

  Future<void> syncData(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(apiUrl), body: json.encode(data));
    if (response.statusCode == 200) {
      print("Data synced successfully");
    } else {
      print("Failed to sync data");
    }
  }
}
