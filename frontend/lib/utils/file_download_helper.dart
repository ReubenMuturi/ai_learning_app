import 'package:flutter_downloader/flutter_downloader.dart';

class FileDownloadHelper {
  Future<void> downloadFile(String url, String savePath) async {
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      savedDir: savePath,
      showNotification: true,
      openFileFromNotification: true,
    );
  }
}
