# student_stadium/views.py
from rest_framework.decorators import api_view
from rest_framework.response import Response 
from .models import SubStadium 
from .serializers import SubStadiumSerializer

@api_view(['GET'])
def get_substadiums(request):
    substadiums = SubStadium.objects.all()
    serializer = SubStadiumSerializer(substadiums, many=True)
    return Response(serializer.data)
 