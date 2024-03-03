from django.db import models

# Create your models here.
class EmployeeList(models.Model):
    ROLES = (
        ('owner', 'Owner'),
        ('client', 'Client'),
    )
    STUTS = (
        ('valid', 'Valid'),
        ('invalid', 'Invalid'),
    )
    name=models.CharField(max_length=55)
    address=models.CharField(max_length=55)
    phoneNumber=models.CharField(max_length=55)
    email=models.EmailField(max_length=55)
    username=models.CharField(max_length=15, unique=True)
    password=models.CharField(max_length=235) 
    role = models.CharField(max_length=10, choices=ROLES) 
    image=models.ImageField(upload_to='images/',default='images/default.jpg')
    status=models.CharField(max_length=23, choices=STUTS)
    
    
    def __str__(self):
        return self.name
        
def employee_exists(username,password):
    return EmployeeList.objects.filter(username=username,password=password).exists()