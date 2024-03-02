from django.urls import path
from . import views

urlpatterns = [
    path('api/bookings/', views.booking_list),
    path('api/bookings/<str:id>/', views.get_booking),
    path('api/bookings/venue/<str:venid>/', views.get_booking_venue),
    # path('api/bookings/user/<str:userid>/', views.get_booking_venue),
    path('api/bookings/<int:pk>/', views.booking_detail),
    path('api/booking/', views.get_schedule, name='bookings'),
    path('api/booking/update_status/<int:transaction>/', views.update_status , name='bookings-detail'),
    path('api/booking/delete/<int:transaction>/', views.delete_booking , name='bookings-delete'),
 path('api/booking/search/', views.search_bookings, name='search_bookings'),

]
