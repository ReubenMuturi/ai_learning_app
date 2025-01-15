// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../services/api_service.dart';
// import '../services/sync_service.dart';
// import 'dart:convert';


// class OfflineManager {
//   final ApiService apiService = ApiService();
//   final SyncService syncService = SyncService();

//   // Check internet connectivity
//   Future<bool> isOnline() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     return connectivityResult != ConnectivityResult.none;
//   }

//   // Store data offline
//   Future<void> storeOfflineData(Map<String, dynamic> data) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('offlineData', json.encode(data));  // Store data as a string
//   }

//   // Fetch offline data
//   Future<Map<String, dynamic>?> getOfflineData() async {
//     final prefs = await SharedPreferences.getInstance();
//     String? offlineData = prefs.getString('offlineData');
//     if (offlineData != null) {
//       return json.decode(offlineData);
//     }
//     return null;
//   }

//   // Sync data when online
//   Future<void> syncOfflineData() async {
//     bool online = await isOnline();
//     if (online) {
//       // Retrieve offline data and sync
//       Map<String, dynamic>? data = await getOfflineData();
//       if (data != null) {
//         await syncService.syncUserProgress(data['userId'], data['lessonId'], data['progress']);
//         // Remove stored data after successful sync
//         final prefs = await SharedPreferences.getInstance();
//         prefs.remove('offlineData');
//       }
//     }
//   }
// }



import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';
import '../services/sync_service.dart';
import 'dart:convert';

class OfflineManager {
  final ApiService apiService = ApiService();
  final SyncService syncService = SyncService();

  // Check internet connectivity
  Future<bool> isOnline() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  // Store data offline
  Future<void> storeOfflineData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('offlineData', json.encode(data));  // Store data as a string
  }

  // Fetch offline data
  Future<Map<String, dynamic>?> getOfflineData() async {
    final prefs = await SharedPreferences.getInstance();
    String? offlineData = prefs.getString('offlineData');
    if (offlineData != null) {
      return json.decode(offlineData);
    }
    return null;
  }

  // Sync data when online
  Future<void> syncOfflineData() async {
    bool online = await isOnline();
    if (online) {
      // Retrieve offline data and sync
      Map<String, dynamic>? data = await getOfflineData();
      if (data != null) {
        await syncService.syncUserProgress(data['userId'], data['lessonId'], data['progress']);
        // Remove stored data after successful sync
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('offlineData');
      }
    }
  }
}
