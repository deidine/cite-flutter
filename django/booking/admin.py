
from django.contrib import admin

from .models import Booking
@admin.register(Booking)
class BookingAdmin(admin.ModelAdmin):
    list_display = ('venueId','userId',
                    'beginTime','endTime','hours',
                    'bookingTime','totalPrice','transactionId')

 
# Register your models here.
