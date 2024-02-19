from django.db import models

from booking.models import Booking

class Venue(models.Model):
    venueId = models.ForeignKey(Booking, on_delete=models.CASCADE)
    venueName = models.CharField(max_length=100)
    pricePerHour =models.IntegerField()
    location = models.CharField(max_length=200)
    category = models.CharField(max_length=100)
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    image = models.ImageField(upload_to='venue_images/')
