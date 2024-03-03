from django.urls import path
from . import views

urlpatterns = [
    path('api/payment/', views.payment_list),
    path('api/payment/create/', views.crate_payment),
    path('api/payment/<int:pk>/', views.payment_detail),
    path('api/payment/delete/<int:id>/', views.delete_payment),
        path('api/payment/img/<int:id>/', views.show_img , name='venue-serve_image'),
    path('api/payment/booking_valid/<int:id>/', views.get_pymt_booking_vlid , name='bookingvlais-detail'),
    path('api/payment/booking_invalid/<int:id>/', views.get_pymt_booking_invl , name='bookinginvlais-detail'),

]
