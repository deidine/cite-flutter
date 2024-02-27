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
        data2 = {
        "venueId": request.data.get('venueId'),
        "userId": request.data.get('userId'),
        "beginTime": request.data.get('beginTime'),
        "endTime": request.data.get('endTime'),
        "hours": request.data.get('hours'),
        "bookingTime": request.data.get('bookingTime'),
        "totalPrice": request.data.get('totalPrice'),
        # "transactionId": 1,
        "status":"invalid"
    } 
        
        print(data2)
        serializer = BookingSerializer(data=data2)
        # print(serializer)
        print(serializer.is_valid())
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
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



def get_schedule(request):
    if request.method == 'GET':
        venue_id = request.GET.get('venue')
        date_str = request.GET.get('date')
        
        try:
            date = datetime.fromtimestamp(int(date_str) / 1000)  # Convert milliseconds since epoch to Python datetime
        except ValueError:
            return JsonResponse({'error': 'Invalid date'}, status=400)

        # Query bookings for the given venue and date
        bookings = Booking.objects.filter(venueId=venue_id, bookingTime__date=date.date())

        # Extract the hours from bookings
        hours = [booking.beginTime for booking in bookings]

        # Construct a list of available hours (e.g., all hours minus booked hours)
        all_hours = list(range(8, 20))  # Assuming working hours are from 8:00 to 20:00
        available_hours = [hour for hour in all_hours if hour not in hours]

        return JsonResponse({'hours': available_hours})
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=405)
    
def get_booking(request,id):
 
    list=Booking.objects.filter(userId=id)
    serializer = BookingSerializer(list, many=True)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 

def get_booking_venue(request,venid):
 
    list=Booking.objects.filter(venueId=venid)
    serializer = BookingSerializer(list, many=True)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 



@api_view(['PUT'])
 
# @csrf_exempt
def update_status(request, transaction):
    try:
        booking = Booking.objects.get(transactionId=transaction)
    except Booking.DoesNotExist:
        return JsonResponse({'error': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)
     
    if request.method == 'PUT':
        print("deien") 
        serializer = BookingSerializer(booking, data=request.data )
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data)
        print(serializer.errors)
        
        return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=status.HTTP_405_METHOD_NOT_ALLOWED)

@api_view(['DELETE'])
def delete_booking(request, transaction):
    try:
        booking = Booking.objects.get(transactionId=transaction)
    except Booking.DoesNotExist:
        return JsonResponse({'error': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)
    
    if request.method == 'DELETE':
        booking.delete()
        return JsonResponse({'message': 'Booking deleted successfully'}, status=status.HTTP_204_NO_CONTENT)