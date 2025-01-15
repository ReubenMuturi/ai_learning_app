// // lib/models/lesson.dart
// class Lesson {
//   final int id;
//   final String title;
//   final String content;

//   Lesson({required this.id, required this.title, required this.content});

//   // Converts a Map to a Lesson instance
//   factory Lesson.fromMap(Map<String, dynamic> map) {
//     return Lesson(
//       id: map['id'],
//       title: map['title'],
//       content: map['content'],
//     );
//   }

//   // Converts a Lesson instance to a Map
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'content': content,
//     };
//   }
// }





class Lesson {
  final int id;
  final String title;
  final String content;

  Lesson({required this.id, required this.title, required this.content});

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
