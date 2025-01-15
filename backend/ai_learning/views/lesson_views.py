# ai_learning/views/lesson_views.py
from django.shortcuts import render
from ai_learning.models import Lesson
from django.core.paginator import Paginator

def lesson_list(request):
    lessons = Lesson.objects.all()
    paginator = Paginator(lessons, 10)  # Show 10 lessons per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'lesson_list.html', {'page_obj': page_obj})

from django.http import HttpResponse

def home(request):
    return HttpResponse("Welcome to AI Learning App!")


