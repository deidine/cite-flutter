# student_stadium/urls.py
from django.urls import path
from .views import get_students

urlpatterns = [
    path('api/students/', get_students, name='get_students'),
    # Add more URLs as needed
]
