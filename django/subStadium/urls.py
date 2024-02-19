# student_stadium/urls.py
from django.urls import path
from .views import get_substadiums 

urlpatterns = [ 
    path('api/substadiums/', get_substadiums, name='get_substadiums') 
    # Add more URLs as needed
]
