from django.urls import path
from . import views

urlpatterns = [
    path('venues/', views.get_venue_list, name='venue-list'),
    path('create/', views.create_venu, name='venue-create'),
    path('venues/<int:pk>/', views.get_venue_list , name='venue-detail'),
]
 