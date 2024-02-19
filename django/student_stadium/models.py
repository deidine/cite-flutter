# student_stadium/models.py
from django.db import models

class Student(models.Model):
    stuName = models.CharField(max_length=100)
    stuFaculty = models.CharField(max_length=100)
    stuMajor = models.CharField(max_length=100)
    stuUsername = models.CharField(max_length=50, unique=True)
    stuPassword = models.CharField(max_length=100)
    stuUrlpicture = models.URLField(null=True, blank=True)

    def __str__(self):
        return self.stuName
