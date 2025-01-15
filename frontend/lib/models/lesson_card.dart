// lib/models/lesson_card.dart
class LessonCard {
  final int id;
  final String title;
  final String description;

  LessonCard({required this.id, required this.title, required this.description});

  factory LessonCard.fromMap(Map<String, dynamic> map) {
    return LessonCard(
      id: map['id'],
      title: map['title'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}
