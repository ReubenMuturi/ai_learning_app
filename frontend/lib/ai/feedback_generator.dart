class FeedbackGenerator {
  String generateFeedback(int score) {
    if (score > 80) {
      return "Great job! You're mastering this!";
    } else if (score > 50) {
      return "Good effort! Keep practicing!";
    } else {
      return "Don't give up! Try again!";
    }
  }
}
