from django.contrib.auth.hashers import check_password
from rest_framework.parsers import JSONParser
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate
from .models import employee_exists

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.http import JsonResponse
from django.http.response import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from .serializers import EmployeeSerializer,EmployeeSerializerUpdate

from employees.forms import EmployeeForm
from employees.models import EmployeeList
from django.contrib.auth.decorators import login_required
# Create your views here.
@login_required(login_url='/login')
def home(request):
    if request.method=='GET':
        form=EmployeeForm()
        list=EmployeeList.objects.all()
        return render(request,'home.html',{'form':form,'list':list})
    if request.method=='POST':
        form=EmployeeForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
        list=EmployeeList.objects.all()
        return HttpResponseRedirect('/home')

@login_required(login_url='/login')
def delete(request,id):
    if request.method=='POST':
        x=EmployeeList.objects.get(id=id)
        x.delete()
        return HttpResponseRedirect('/home')
    return HttpResponse("Item not deleted")
# @csrf_exempt
@api_view(['PUT'])

def update_employee(request, id): 
    try:
        employee = EmployeeList.objects.get(id=id)
    except EmployeeList.DoesNotExist:
        return JsonResponse({'error': 'Employee not found'}, status=status.HTTP_404_NOT_FOUND)
     
    serializer = EmployeeSerializerUpdate(employee, data=request.data)
    if serializer.is_valid():
        serializer.save()
        return JsonResponse(serializer.data)
    print(serializer.errors)
    
    return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def create_employee(request):
    if request.method == 'POST':
        serializer = EmployeeSerializer(data=request.data)
        # from django.contrib.auth.hashers import make_password

        #     raw_password = request.POST.get('password')
        # hashed_password = make_password(raw_password)
        print( request.data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
        print(serializer.errors)
        return JsonResponse(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

 


def get_employee_list(request):
    employees = [
        {'id': 1, 'name': 'John Doe', 'position': 'Developer'},
        {'id': 2, 'name': 'Jane Doe', 'position': 'Designer'},
        # Add more employee data as needed
    ]
    list=EmployeeList.objects.all()
    serializer = EmployeeSerializer(list, many=True)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 

def get_employe(request,id):
 
    list=EmployeeList.objects.get(id=id)
    serializer = EmployeeSerializer(list)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 


def get_employeByname(request,username):
 
    list=EmployeeList.objects.get(username=username)
    serializer = EmployeeSerializer(list)

    # return JsonResponse({'employees': employees})
    return JsonResponse(serializer.data, safe=False) 


# @csrf_exempt


@api_view(['POST'])
def login(request):
    if request.method == 'POST':
        username = request.data.get('username')
        password = request.data.get('password')
        
        # Check if the username exists in the EmployeeList
        employee = EmployeeList.objects.filter(username=username).first()
        if employee:
            # Verify the password
            # if check_password(password, employee.password):
            if (EmployeeList.objects.filter(password=password).first()):
                # Password is correct
                return Response({'message': 'Login successful'})
            else:
                # Password is incorrect
                return Response({'error': 'Invalid password'}, status=400)
        else:
            # Username does not exist
            return Response({'error': 'Employee does not exist'}, status=400)
    else:
        return Response({'error': 'Invalid request method'}, status=405)
    

def get_csrf_token(request):
    # Get the CSRF token from the request's cookies
    csrf_token = request.COOKIES.get('csrftoken')
    # Return the CSRF token in the response headers
    response = JsonResponse({'csrf_token': csrf_token})
    return response