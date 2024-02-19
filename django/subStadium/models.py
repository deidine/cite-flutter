# student_stadium/models.py
from django.db import models

from staduim.models import Stadium


class SubStadium(models.Model):
    stdId = models.ForeignKey(Stadium, on_delete=models.CASCADE)
    substdName = models.CharField(max_length=100)
    substdUrlPicture = models.URLField()

    def __str__(self):
        return f"{self.stdId.stdName} - {self.substdName}"
