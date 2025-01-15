from django.urls import path
from .views.auth_views import login_view
from .views.lesson_views import lesson_list
from .views.home_views import home_view  # Add your homepage view here
from .views.ai_views import predict
from .views.sync_views import sync_progress


urlpatterns = [
    path('lessons/', lesson_list, name='lesson_list'),
    path('api/auth/login/', login_view, name='login'),
    path('home/', home_view, name='home'),  # Add this
    path('predict/', predict, name='predict'),
    path('syncProgress/', sync_progress, name='sync_progress'),


    
]


