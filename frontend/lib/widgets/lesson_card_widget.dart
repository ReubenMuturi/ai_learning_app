import 'package:flutter/material.dart';

class LessonCardWidget extends StatelessWidget {
  final String title;
  final String description;

  const LessonCardWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        onTap: () {
          // Navigate to the lesson details page
        },
      ),
    );
  }
}


