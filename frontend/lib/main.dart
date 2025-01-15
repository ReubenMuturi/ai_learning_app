// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'screens/home_screen.dart';
// import 'screens/login_screen.dart';
// import 'services/sync_service.dart';


// void main() {
//   SyncManager.startSyncListener((data) async {
//     // Call your sync API or backend to update data
//     print("Syncing data: $data");
//   });

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Learning App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginScreen(), // Initial screen on app launch
//       routes: {
//         '/home': (context) => HomeScreen(),
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'services/sync_service.dart';
import 'screens/home_screen.dart';

void main() {
  // Initialize the sync listener that will trigger the sync when data changes
  SyncService.startSyncListener((data) async {
    // Call your sync API or backend to update data
    print("Syncing data: $data");

    // Create an instance of SyncService to call the syncUserProgress method
    SyncService syncService = SyncService();
    await syncService.syncUserProgress(data['userId'], data['lessonId'], data['progress']);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Offline Frontend Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
