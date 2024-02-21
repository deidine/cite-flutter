from rest_framework import serializers
from .models import Booking

class BookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Booking
        fields = ('venueId','userId','beginTime','endTime','hours','bookingTime','totalPrice','status','transactionId')
# class BookingSerializerCreate(serializers.ModelSerializer):
    
#     class Meta:
#         model = Booking
#         fields = ('venueId','userId','beginTime','endTime','hours','bookingTime','totalPrice' ) 
