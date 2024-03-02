from django.http import FileResponse
from django.shortcuts import get_object_or_404
from django.http import JsonResponse

from .models import Venue
from .serializers import VenueSerializer
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
@api_view(['GET'])
def get_venue_list(request):
 
    list=Venue.objects.filter( status='valid')
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


@api_view(['DELETE'])
def delete_venue(request, id):
    try:
        booking = Venue.objects.get(venueId=id)
    except Venue.DoesNotExist:
        return JsonResponse({'error': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'DELETE':
        booking.delete()
        return JsonResponse({'message': 'Booking deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


@api_view(['GET'])
def get_venue_user(request, id):
 
    list=Venue.objects.filter(userId=id, status='valid')
    serializer = VenueSerializer(list, many=True)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 

def serve_image(request, id):
    # Retrieve the ImageModel object from the database
    image = get_object_or_404(Venue, pk=id)

    # Open the image file and serve it using FileResponse
    return FileResponse(open(image.image.path, 'rb'), content_type='image/jpeg')

def show_img(request,id):
    try:
        venue = Venue.objects.get(pk=id)
    except Venue.DoesNotExist:
        return JsonResponse({'error': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)
     
    if request.method == 'GET':
        return FileResponse(open(venue.image.path, 'rb'), content_type='image/jpeg')
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=status.HTTP_405_METHOD_NOT_ALLOWED)
