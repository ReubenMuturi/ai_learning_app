import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ai_learning_app/database/database_helper.dart';

class DataSyncRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  final Connectivity _connectivityService = Connectivity();

  Future<void> syncOfflineData() async {
    var database = await _databaseHelper.database;
    var progressData = await database.query('user_progress');
    
    // Get the connectivity result (it could be a list, but we're interested in individual results)
    ConnectivityResult connectivityResult = await _connectivityService.checkConnectivity();

    // Check if there's a connection (either WiFi or mobile)
    bool isConnected = connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile;

    if (isConnected) {
      // Sync data to the server with the fetched progressData.
      await syncDataToServer(progressData);
    } else {
      // Handle offline scenario if no internet connection.
    }
  }

  // Sync data to the server (example).
  Future<void> syncDataToServer(List<Map<String, dynamic>> data) async {
    // Implement your server syncing logic here.
    // For example:
    // await http.post('your_server_endpoint', body: data);
  }
}





