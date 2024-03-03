from rest_framework import serializers
from .models import Payment

class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = ('pymId', 'bookinId','pymtTime','bankApp','status','image','phone','solde')
# class BookingSerializerCreate(serializers.ModelSerializer):
    
#     class Meta:
#         model = Booking
#         fields = ('venueId','userId','beginTime','endTime','hours','bookingTime','totalPrice' ) 
