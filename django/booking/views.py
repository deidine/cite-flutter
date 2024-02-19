import datetime
from django.http import JsonResponse
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import Booking
from .serializers import BookingSerializer

@api_view(['GET', 'POST'])
def booking_list(request):
    if request.method == 'GET':
        bookings = Booking.objects.all()
        serializer = BookingSerializer(bookings, many=True)
        return JsonResponse(serializer.data,safe=False)
    
    elif request.method == 'POST':
        serializer = BookingSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET', 'PUT', 'DELETE'])
def booking_detail(request, pk):
    try:
        booking = Booking.objects.get(pk=pk)
    except Booking.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = BookingSerializer(booking)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = BookingSerializer(booking, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        booking.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
 
def bookingsVenuDate(request):
    venue_id = request.GET.get('venue')
    date = request.GET.get('date')

    if not venue_id or not date:
        return JsonResponse({'error': 'Both venue and date parameters are required.'}, status=400)

    try:
        venue_id = int(venue_id)
        # date=datetime.strptime(date, "%Y-%m-%d %H:%M:%S.%f").strftime("%Y-%m-%d %H:%M:%S.%f")
        date = datetime.datetime.fromtimestamp(int(date) / 1000)  # Convert timestamp to datetime object
    except (ValueError, OverflowError):
        return JsonResponse({'error': 'Invalid venue or date parameter.'}, status=400)

    bookings = Booking.objects.filter(venueId=venue_id, beginTime__date=date)

    # Serialize bookings data if needed
    data = [{'transactionId': booking.transactionId, 'userId': booking.userId, 'beginTime': booking.beginTime,
             'endTime': booking.endTime, 'hours': booking.hours, 'bookingTime': booking.bookingTime,
             'totalPrice': booking.totalPrice} for booking in bookings]
    return JsonResponse(data, safe=False)