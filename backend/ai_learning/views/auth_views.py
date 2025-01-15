# from django.contrib.auth.models import User
# from django.contrib.auth import authenticate
# from django.http import JsonResponse
# from rest_framework.decorators import api_view

# @api_view(['POST'])
# def login_view(request):
#     email = request.data.get('email')
#     password = request.data.get('password')

#     try:
#         user = User.objects.get(email=email)
#     except User.DoesNotExist:
#         return JsonResponse({'error': 'Invalid credentials'}, status=400)

#     # Authenticate the user using the username (email in this case)
#     user = authenticate(username=user.username, password=password)
#     if user is not None:
#         return JsonResponse({'message': 'Login successful'})
#     else:
#         return JsonResponse({'error': 'Invalid credentials'}, status=400)



# from rest_framework import status
# from rest_framework.decorators import api_view
# from rest_framework.response import Response
# from django.http import JsonResponse
# from django.contrib.auth import authenticate
# import logging

# logger = logging.getLogger(__name__)

# @api_view(['POST'])
# def login_view(request):
#     email = request.data.get('email')
#     password = request.data.get('password')

#     logger.info(f'Received email: {email}, password: {password}')

#     if not email or not password:
#         return JsonResponse({'error': 'Email and password are required.'}, status=400)

#     user = authenticate(request, username=email, password=password)

#     if user is not None:
#         return JsonResponse({'message': 'Login successful'}, status=200)
#     else:
#         return JsonResponse({'error': 'Invalid credentials'}, status=400)


# from django.http import JsonResponse
# from django.contrib.auth import authenticate
# from rest_framework.decorators import api_view

# @api_view(['POST'])
# def login_view(request):
#     email = request.data.get('email')
#     password = request.data.get('password')

#     if not email or not password:
#         return JsonResponse({'error': 'Email and password are required.'}, status=400)

#     user = authenticate(request, username=email, password=password)

#     if user is not None:
#         return JsonResponse({'message': 'Login successful'}, status=200)
#     else:
#         return JsonResponse({'error': 'Invalid credentials'}, status=400)



# from django.views.decorators.csrf import csrf_exempt
# from rest_framework.decorators import api_view, permission_classes
# from rest_framework.permissions import AllowAny
# from django.contrib.auth import authenticate
# from django.http import JsonResponse

# @csrf_exempt
# @api_view(['POST'])
# @permission_classes([AllowAny])
# def login_view(request):
#     print("Request Data:", request.data)  # Log the request data for debugging

#     email = request.data.get('email')
#     password = request.data.get('password')

#     if not email or not password:
#         return JsonResponse({'error': 'Email and password are required.'}, status=400)

#     # Log before calling authenticate
#     print("Authenticating user with email:", email)

#     user = authenticate(request, username=email, password=password)

#     if user is not None:
#         print("User authenticated successfully")
#         return JsonResponse({'message': 'Login successful'}, status=200)
#     else:
#         print("Invalid credentials")
#         return JsonResponse({'error': 'Invalid credentials'}, status=400)


# from rest_framework_simplejwt.tokens import RefreshToken
# from django.contrib.auth import authenticate
# from django.views.decorators.csrf import csrf_exempt
# from rest_framework.decorators import api_view, permission_classes
# from rest_framework.permissions import AllowAny
# from django.http import JsonResponse

# @csrf_exempt
# @api_view(['POST'])
# @permission_classes([AllowAny])
# def login_view(request):
#     email = request.data.get('email')
#     password = request.data.get('password')

#     if not email or not password:
#         return JsonResponse({'error': 'Email and password are required.'}, status=400)

#     user = authenticate(request, username=email, password=password)

#     if user is not None:
#         refresh = RefreshToken.for_user(user)
#         return JsonResponse({
#             'message': 'Login successful',
#             'token': str(refresh.access_token),  # Send back the access token
#         }, status=200)
#     else:
#         return JsonResponse({'error': 'Invalid credentials'}, status=400)





from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny

@api_view(['POST'])
@permission_classes([AllowAny])
def login_view(request):
    print("Request Data:", request.data)  # Debugging info

    email = request.data.get('email')
    password = request.data.get('password')

    if not email or not password:
        return JsonResponse({'error': 'Email and password are required.'}, status=400)

    # Authenticate the user
    print("Authenticating user with email:", email)
    user = authenticate(request, username=email, password=password)

    if user is not None:
        login(request, user)  # Logs in the user and creates a session
        return JsonResponse({'message': 'Login successful', 'user_id': user.id}, status=200)
    else:
        return JsonResponse({'error': 'Invalid credentials'}, status=400)
