from rest_framework import serializers
from .models import Venue

class VenueSerializer(serializers.ModelSerializer):
    class Meta:
        model = Venue
        fields = ('venueId_id', 'venueName', 'pricePerHour', 'location', 'category', 'rating', 'image')
