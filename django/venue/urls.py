from django.urls import path
from . import views

urlpatterns = [
    path('venues/', views.get_venue_list, name='venue-list'),
    path('venues/search/', views.search_venues, name='venue-list'),
    path('venues/create/', views.create_venu, name='venue-create'),
    path('venues/delete/<int:id>/', views.delete_venue , name='venue-delete'),
    path('venues/img/<int:id>/', views.show_img , name='venue-serve_image'),
    path('venues/<int:id>/', views.get_venue_list , name='venue-detail'),

    path('venues/user/<int:id>/', views.get_venue_user , name='venue-detail'),
]
  