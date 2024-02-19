from django.db import models

# Create your models here.
class EmployeeList(models.Model):
    name=models.CharField(max_length=55)
    address=models.CharField(max_length=55)
    phoneNumber=models.CharField(max_length=55)
    email=models.EmailField(max_length=55)
    username=models.CharField(max_length=15)
    password=models.CharField(max_length=235)
    # date_of_joining=models.DateField()
    # today=models.DateField(auto_now_add=True)
    image=models.ImageField(upload_to='images/',default='images/default.jpg')
    def __str__(self):
        return self.name
        
def employee_exists(username,password):
    return EmployeeList.objects.filter(username=username,password=password).exists()