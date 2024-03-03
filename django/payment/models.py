from django.db import models
from booking.models import Booking

from employees.models import EmployeeList
 

class Payment(models.Model):
    STUTS = (
        ('valid', 'Valid'),
        ('invalid', 'Invalid'),
    )
    pymId =  models.AutoField(primary_key=True)
    bookinId=models.ForeignKey(Booking, on_delete=models.CASCADE)
    pymtTime = models.DateField( )
    phone = models.IntegerField(  )
    solde = models.DecimalField( max_digits=10, decimal_places=1 )
    bankApp = models.CharField(max_length=40) 
    status=models.CharField(max_length=23, choices=STUTS)
    image = models.ImageField(upload_to='paymt_images/')
