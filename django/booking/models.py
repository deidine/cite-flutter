from django.db import models
from  employees.models import EmployeeList

from  venue.models import Venue

class Booking(models.Model): 
    STUTS = (
        ('valid', 'Valid'),
        ('invalid', 'Invalid'),
    )
    transactionId=models.AutoField(primary_key=True)
    venueId=models.ForeignKey(Venue, on_delete=models.CASCADE)
    userId = models.ForeignKey(EmployeeList, on_delete=models.CASCADE)
    beginTime = models.TimeField()
    endTime = models.TimeField()
    hours = models.IntegerField( )
    bookingTime = models.DateField( )
    totalPrice = models.IntegerField( )
    status=models.CharField(max_length=23, choices=STUTS)
