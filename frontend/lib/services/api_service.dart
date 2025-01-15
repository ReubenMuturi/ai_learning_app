// import 'dart:convert'; // Add this import
// import 'package:http/http.dart' as http;

// class ApiService {
//   final String baseUrl = 'http://127.0.0.1:8000';

//   Future<List<Map<String, dynamic>>> fetchLessons() async {
//     final response = await http.get(Uri.parse('$baseUrl/lessons/'));
//     if (response.statusCode == 200) {
//       return List<Map<String, dynamic>>.from(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load lessons');
//     }
//   }

//   Future<Map<String, dynamic>> fetchLessonById(int id) async {
//     final response = await http.get(Uri.parse('$baseUrl/lessons/$id'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load lesson');
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response> get(String url) async {
    return await http.get(Uri.parse(url));
  }

  static Future<http.Response> post(String url, Map<String, dynamic> data) async {
    return await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
