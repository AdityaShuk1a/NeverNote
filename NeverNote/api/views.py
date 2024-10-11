
# def signup(request):
#     if request == ['POST']

from django.shortcuts import render
from rest_framework import generics, serializers
from module.admin import *
from module.models import *
from module.serializers import *
# Create your views here.

class UserDataList(generics.ListCreateAPIView):
    serializer_class = UserModelSerializer
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        if(pk == None):
            return UserModel.objects.all().order_by('-timestamp')
        return UserModel.objects.filter(user_name=pk).order_by('-timestamp')

class NotesModelList(generics.ListCreateAPIView):
    serializer_class = NotesModelSerializer
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        if(pk == None):
            return NotesModel.objects.all().order_by('-updated_at_timestamp')
        return NotesModel.objects.filter(user_name_pk=pk).order_by('-updated_at_timestamp')        

class AllUserNotesList(generics.ListAPIView):
    serializer_class = NotesModelSerializer
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        if(pk == None):
            return NotesModel.objects.all().order_by('-updated_at_timestamp')
        return NotesModel.objects.filter(user_name_p=pk).order_by('-updated_at_timestamp')        
    

from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny 

class RegisterUserView(generics.CreateAPIView):
    queryset = UserModel.objects.all()
    serializer_class = UserModelSerializer
    permission_classes = [AllowAny]  # Allow any user to access this view as settings.py is set to only allow access to authenticated users or someshi ...t

    def create(self, request, *args, **kwargs):
        # Override to handle custom logic
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            self.perform_create(serializer)
            return Response({"message": "User created successfully."}, status=status.HTTP_201_CREATED)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def perform_create(self, serializer):
        # You can hash the password here before saving but we wont
        serializer.save()



class LoginUserView(generics.GenericAPIView):
    permission_classes = [AllowAny]  # Allow any user to access this view
    
    def post(self, request, *args, **kwargs):
        # Extract username and password from request data
        username = request.data.get('username')
        password = request.data.get('password')

        # # Authenticate the user  ----> we wont coz we aren't storing the password in hashed form so authenticate wont work
        # user = authenticate(username=username, password=password) 

        try:
            # fetch the user manually from the database
            user = UserModel.objects.get(user_name = username)

            # check if the plain password matches the one in db
            if user.user_password == password:
                
                return Response({
                    "success" : True,
                    "message": "Login successful!",
                    "token": "dummy-token"  # You can replace this with a real token if needed
                }, status=status.HTTP_200_OK)
            else:
                # Return an error response for invalid credentials
                return Response({
                    "success" : False,
                    "error": "Invalid credentials"
                }, status=status.HTTP_400_BAD_REQUEST)
        
        except UserModel.DoesNotExist:
            return Response({
                "success" : False,
                "error": "Invalid credentials, user dont exist"
            }, status = status.HTTP_400_BAD_REQUEST)

# from django.http import HttpResponse                    ---------------------------------> to test

# def home(request):                                  
#     return HttpResponse("Welcome to NeverNote!")