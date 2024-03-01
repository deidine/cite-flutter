from django.http import JsonResponse

from .models import Venue
from .serializers import VenueSerializer
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
@api_view(['GET'])
def get_venue_list(request):
 
    list=Venue.objects.all()
    serializer = VenueSerializer(list, many=True)
 
    return JsonResponse(serializer.data, safe=False) 


@api_view(['POST'])
def create_venu(request):
    if request.method == 'POST':
        serializer = VenueSerializer(data=request.data)
        # print( request.data)
        if serializer.is_valid(): 
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# def search_bookings(request):
def search_venues(request):
    search = request.POST.get('venueName', '')
    venues = Venue.objects.filter(venueName=search )
    serializer = VenueSerializer(venues, many=True)
    return JsonResponse(serializer.data, safe=False)
