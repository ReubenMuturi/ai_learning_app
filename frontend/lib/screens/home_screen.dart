// // lib/screens/home_screen.dart
// import 'package:flutter/material.dart';
// import 'lesson_screen.dart';
// import 'progress_screen.dart';
// import 'ai_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home')),
//       body: ListView(
//         children: [
//           ListTile(
//             leading: Icon(Icons.book),
//             title: Text('Lessons'),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => LessonScreen()),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.assessment),
//             title: Text('Progress'),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ProgressScreen()),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.android), // Changed to a valid icon
//             title: Text('AI'),
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => AIScreen()),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import '../services/network_service.dart';
import '../utils/offline_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isOnline = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    _isOnline = await NetworkService.isOnline();
    setState(() {});
  }

  Future<void> saveOfflineData() async {
    await OfflineStorage.saveData('offlineData', {
      'userId': 1,
      'lessonId': 101,
      'progress': 80,
    });
    print("Data saved offline.");
  }

  Future<void> getOfflineData() async {
    var data = await OfflineStorage.getData('offlineData');
    print("Offline data: $data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Offline Frontend Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connectivity: ${_isOnline ? 'Online' : 'Offline'}"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveOfflineData,
              child: Text("Save Offline Data"),
            ),
            ElevatedButton(
              onPressed: getOfflineData,
              child: Text("Get Offline Data"),
            ),
          ],
        ),
      ),
    );
  }
}
