from django.db import models
from django.contrib.auth.models import User

class Lesson(models.Model):
    title = models.CharField(max_length=200)
    content = models.TextField()


class UserProgress(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE)
    progress = models.IntegerField(default=0)  # Progress percentage (0-100)

    def __str__(self):
        return f'{self.user.username} - {self.lesson.title} ({self.progress}%)'

    def __str__(self):
        return self.title
