from django.http import JsonResponse
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Stadium
from .serializers import StadiumSerializer

@api_view(['GET'])
def get_stadium_list(request):
    stadiums = Stadium.objects.all()
    serializer = StadiumSerializer(stadiums, many=True)
    #you have two choice to retun the json or tu return template show json
    # return Response({'stadiums': serializer.data})
    return JsonResponse({'stadiums': serializer.data})