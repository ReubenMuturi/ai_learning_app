class UserProgress {
  final int userId;
  final int lessonId;
  final int progress;

  UserProgress({required this.userId, required this.lessonId, required this.progress});

  factory UserProgress.fromMap(Map<String, dynamic> map) {
    return UserProgress(
      userId: map['userId'],
      lessonId: map['lessonId'],
      progress: map['progress'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'lessonId': lessonId,
      'progress': progress,
    };
  }
}
