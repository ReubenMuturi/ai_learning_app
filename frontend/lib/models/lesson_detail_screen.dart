// lib/models/lesson_detail_screen.dart
import 'package:flutter/material.dart';

class LessonDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const LessonDetailScreen({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }
}
