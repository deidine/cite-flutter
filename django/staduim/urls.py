# urls.py
from django.urls import path
from .views import get_stadium_list
from . import views
urlpatterns = [
     path('api/stadiums/', views.get_stadium_list, name='get_stadium_list'), 
    # Add more URLs as needed
]
from django.conf import settings
from django.conf.urls.static import static
if settings.DEBUG:
        urlpatterns += static(settings.MEDIA_URL,
                              document_root=settings.MEDIA_ROOT)
