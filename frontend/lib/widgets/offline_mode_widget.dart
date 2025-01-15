// // lib/widgets/offline_mode_widget.dart
// import 'package:flutter/material.dart';

// class OfflineModeWidget extends StatelessWidget {
//   final String message;

//   const OfflineModeWidget({super.key, required this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         color: Colors.red.withOpacity(0.5),
//         padding: EdgeInsets.all(20),
//         child: Text(
//           message,
//           style: TextStyle(color: Colors.white, fontSize: 18),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class OfflineModeWidget extends StatelessWidget {
  const OfflineModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Convert the Stream<List<ConnectivityResult>> to Stream<ConnectivityResult>
    Stream<ConnectivityResult> connectivityStream = Connectivity().onConnectivityChanged
        .map((List<ConnectivityResult> results) => results.isNotEmpty ? results.first : ConnectivityResult.none);

    return StreamBuilder<ConnectivityResult>(
      stream: connectivityStream,  // Pass the correctly typed stream
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == ConnectivityResult.none) {
            return SnackBar(content: Text('You are offline.'));
          } else {
            return SnackBar(content: Text('Back online! Syncing your data.'));
          }
        }
        return Container(); // Empty container if no data
      },
    );
  }
}
