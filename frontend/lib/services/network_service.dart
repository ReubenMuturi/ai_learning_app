import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static final Connectivity _connectivity = Connectivity();

  // Listen for connectivity changes and return the stream of a single ConnectivityResult
  static Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged
          .map((List<ConnectivityResult> results) => results.isNotEmpty ? results.first : ConnectivityResult.none);

  // Check current connectivity status
  static Future<bool> isOnline() async {
    var result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
