from django.contrib import admin
from .models import EmployeeList
# Register your models here.
@admin.register(EmployeeList)
class EmployeeModel(admin.ModelAdmin):
    list_display=['name','phoneNumber','email']