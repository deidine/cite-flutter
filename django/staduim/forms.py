from employees.models import Stadium
from django import forms
#Create your form here
class StadiumForm(forms.ModelForm):
    class Meta:
        model=Stadium
        # fields='__all__'