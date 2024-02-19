from django.urls import path,include
from . import views
urlpatterns = [
    path('',views.home,name='home'),  
    path('create/', views.create_employee, name='create_employee'),
    path('login/', views.login, name='login'),

    path('delete/<str:id>/',views.delete,name='delete'),
    path('update/<str:id>/',views.update,name='update'),
     path('api/employees/', views.get_employee_list, name='get_employee_list'),
     path('api/employees/<str:id>/', views.get_employe, name='get_employe'),
     path('api/employees/name/<str:username>/', views.get_employeByname, name='get_employebyname'),
]

from django.conf import settings
from django.conf.urls.static import static
if settings.DEBUG:
        urlpatterns += static(settings.MEDIA_URL,
                              document_root=settings.MEDIA_ROOT)
