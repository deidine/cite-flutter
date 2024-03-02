from rest_framework import serializers
from .models import Venue

class VenueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Venue
        fields = ('userId', 'venueId','venueName', 'pricePerHour', 'location', 'category',
                   'rating', 'image','status')
