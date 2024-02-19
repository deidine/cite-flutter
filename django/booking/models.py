from django.db import models

class Booking(models.Model):
    transactionId=models.IntegerField()
    venueId = models.AutoField(primary_key=True)
    userId = models.IntegerField()
    beginTime = models.DateTimeField()
    endTime = models.DateTimeField()
    hours = models.DecimalField(max_digits=5, decimal_places=2)
    bookingTime = models.DateTimeField(auto_now_add=True)
    totalPrice = models.DecimalField(max_digits=10, decimal_places=2)