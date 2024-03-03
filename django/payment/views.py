from django.http import FileResponse

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.response import Response
from django.http import JsonResponse
from django.shortcuts import render
from payment.serializers import PaymentSerializer

from payment.models import Payment

# Create your views here.
def payment_list(request):
    if request.method == 'GET':
        bookings = Payment.objects.all()
        serializer = PaymentSerializer(bookings, many=True)
        return JsonResponse(serializer.data,safe=False)
@api_view(['POST'])    
def crate_payment(request):
    if request.method == 'POST':
        serializer = PaymentSerializer(data=request.data)
        print(request.data.get('solde'))
        print(serializer.is_valid())
        print(serializer)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

 

@api_view(['GET', 'PUT', 'DELETE'])
def payment_detail(request, pk):
    try:
        booking = Payment.objects.get(pk=pk)
    except Payment.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    if request.method == 'GET':
        serializer = PaymentSerializer(booking)
        return Response(serializer.data)

    elif request.method == 'PUT':
        serializer = PaymentSerializer(booking, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    elif request.method == 'DELETE':
        booking.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
    


def delete_payment(request,id):
    try:

        booking = Payment.objects.get(pymId=id)
    except Payment.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)

    booking.delete()
    return Response(status=status.HTTP_204_NO_CONTENT)



@api_view(['GET'])
def get_pymt_booking_vlid(request, id):
 
    list=Payment.objects.filter(bookinId=id, status='valid')
    serializer = PaymentSerializer(list, many=True)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 


@api_view(['GET'])
def get_pymt_booking_invl(request, id):
 
    list=Payment.objects.filter(bookinId=id, status='invalid')
    serializer = PaymentSerializer(list, many=True)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 

def show_img(request,id):
    try:
        venue = Payment.objects.get(pk=id)
    except Payment.DoesNotExist:
        return JsonResponse({'error': 'Booking not found'}, status=status.HTTP_404_NOT_FOUND)
     
    if request.method == 'GET':
        return FileResponse(open(venue.image.path, 'rb'), content_type='image/jpeg')
    else:
        return JsonResponse({'error': 'Method not allowed'}, status=status.HTTP_405_METHOD_NOT_ALLOWED)
