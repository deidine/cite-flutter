from django.urls import path
from . import views

urlpatterns = [
    path('api/bookings/', views.booking_list),
    path('api/bookings/<int:pk>/', views.booking_detail),
        path('api/booking', views.bookingsVenuDate, name='bookings'),

]
