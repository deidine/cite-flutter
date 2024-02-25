from .models import EmployeeList
from rest_framework import serializers

class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = EmployeeList
        fields = ('id','name', 'address', 'phoneNumber', 'email', 'username','role', 'password','image')
class EmployeeSerializerUpdate(serializers.ModelSerializer):
    class Meta:
        model = EmployeeList
        fields = ('id','name', 'address', 'phoneNumber', 'email' )
