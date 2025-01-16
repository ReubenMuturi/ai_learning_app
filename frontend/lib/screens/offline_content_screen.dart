import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../database/database_helper.dart';

class OfflineContentScreen extends StatefulWidget {
  const OfflineContentScreen({super.key});

  @override
  _OfflineContentScreenState createState() => _OfflineContentScreenState();
}

class _OfflineContentScreenState extends State<OfflineContentScreen> {
  late Future<List<Lesson>> lessons;

  @override
  void initState() {
    super.initState();
    lessons = fetchLessons();
  }

  Future<List<Lesson>> fetchLessons() async {
    final data = await DatabaseHelper.instance.fetchData();
    return data.map((lesson) => Lesson.fromMap(lesson)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Offline Content")),
      body: FutureBuilder<List<Lesson>>(
        future: lessons,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading lessons'));
          }
          final lessons = snapshot.data!;
          return ListView.builder(
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lessons[index].title),
                subtitle: Text(lessons[index].content),
              );
            },
          );
        },
      ),
    );
  }
}
