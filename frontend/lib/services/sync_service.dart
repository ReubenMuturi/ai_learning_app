import 'package:ai_learning_app/database/data_sync_repository.dart';
import 'connectivity_service.dart';

class SyncService {
  final DataSyncRepository _dataSyncRepository = DataSyncRepository();
  final ConnectivityService _connectivityService = ConnectivityService();

  Future<void> syncIfNeeded(Map<String, dynamic> offlineData) async {
    if (await _connectivityService.isOnline()) {
      await _dataSyncRepository.syncData(offlineData);
    } else {
      print('No internet connection. Data will sync later.');
    }
  }
}
