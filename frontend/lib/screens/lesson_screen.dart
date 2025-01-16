import 'package:flutter/material.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lessons'),
      ),
      body: ListView(
        children: [
          // Lesson items will be dynamically loaded here
          ListTile(title: Text('Lesson 1')),
          ListTile(title: Text('Lesson 2')),
        ],
      ),
    );
  }
}
