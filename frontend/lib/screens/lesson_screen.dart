// // lib/screens/lesson_screen.dart
// import 'package:flutter/material.dart';

// class LessonScreen extends StatelessWidget {
//   const LessonScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Lessons')),
//       body: Center(child: Text('Lesson content goes here')),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:your_app/database/database_helper.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _lessons = [];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  Future<void> _loadLessons() async {
    final lessons = await _dbHelper.fetchAllLessons();
    setState(() {
      _lessons = lessons;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lessons")),
      body: ListView.builder(
        itemCount: _lessons.length,
        itemBuilder: (context, index) {
          final lesson = _lessons[index];
          return ListTile(
            title: Text(lesson['title']),
            subtitle: Text(lesson['description']),
            onTap: () {
              // Navigate to lesson detail screen
            },
          );
        },
      ),
    );
  }
}
