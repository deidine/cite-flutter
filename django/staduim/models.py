
from django.db import models

class Stadium(models.Model):
    stdName = models.CharField(max_length=255)
    stdNumberOfPlayer = models.IntegerField()
    stdUrlPicture = models.URLField()
    stdDescripLocation = models.TextField()
    stdProcedure = models.CharField(max_length=255)
    stdClosedId = models.CharField(max_length=50)
    stdClosedDate = models.DateField(null=True, blank=True)
    stdClosedNote = models.TextField(null=True, blank=True)
    