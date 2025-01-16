// lib/screens/progress_screen.dart
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress')),
      body: Center(
        child: Text('User Progress will be displayed here.'),
      ),
    );
  }
}
