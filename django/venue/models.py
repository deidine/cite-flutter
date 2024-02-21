from django.db import models
 

class Venue(models.Model):
    venueId =  models.AutoField(primary_key=True)
    venueName = models.CharField(max_length=100)
    pricePerHour =models.IntegerField()
    location = models.CharField(max_length=200)
    category = models.CharField(max_length=100)
    rating = models.DecimalField(max_digits=3, decimal_places=1)
    image = models.ImageField(upload_to='venue_images/')
