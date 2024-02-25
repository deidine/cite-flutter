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
        print( request.data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=status.HTTP_201_CREATED)
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
    username = request.data.get('username')
    password = request.data.get('password')
    if employee_exists(username,password):
        return HttpResponse('Employee exists')
    else:
        return HttpResponse('Employee does not exist')
    

 
def get_csrf_token(request):
    # Get the CSRF token from the request's cookies
    csrf_token = request.COOKIES.get('csrftoken')
    # Return the CSRF token in the response headers
    response = JsonResponse({'csrf_token': csrf_token})
    return response