# student_stadium/serializers.py
from rest_framework import serializers

from staduim.serializers import StadiumSerializer
from .models import   SubStadium


class SubStadiumSerializer(serializers.ModelSerializer):
    stdId = StadiumSerializer()  # Nested serializer for stdId field

    class Meta:
        model = SubStadium
        fields = '__all__'

