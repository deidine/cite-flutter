# student_stadium/views.py
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import status
from .models import Student
from .serializers import StudentSerializer

@api_view(['GET'])
def get_students(request):
    students = Student.objects.all()
    serializer = StudentSerializer(students, many=True)
    return Response(serializer.data)
