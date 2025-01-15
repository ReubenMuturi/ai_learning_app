# ai_learning/views/sync_views.py
from django.http import JsonResponse
from ai_learning.models import Lesson
import json
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def sync_progress(request):
    # Authenticated user data is accessible through request.user
    ...

    if request.method == "POST":
        try:
            data = json.loads(request.body)
            user_id = data.get('userId')
            lesson_id = data.get('lessonId')
            progress = data.get('progress')

            if not all([user_id, lesson_id, progress]):
                return JsonResponse({'error': 'Missing required fields'}, status=400)

            # Update or create progress
            # Your UserProgress model update logic goes here.

            return JsonResponse({'status': 'success', 'message': 'Progress synced successfully'})
        except Exception as e:
            return JsonResponse({'error': str(e)}, status=500)
    return JsonResponse({'error': 'Invalid request method'}, status=405)
