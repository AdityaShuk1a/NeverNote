from django.shortcuts import render
from rest_framework import generics, serializers
from rest_framework.response import Response
from rest_framework import status
from module.admin import *
from module.models import *
from module.serializers import *
from rest_framework.views import APIView
# Create your views here.



class UserDataList(generics.ListCreateAPIView):
    serializer_class = UserModelSerializer
    def get_queryset(self):
        pk = self.kwargs.get('pk')
        if(pk == None):
            return UserModel.objects.all().order_by('-timestamp')
        return UserModel.objects.filter(id=pk).values('user_name', 'user_email', 'user_phone_number').order_by('-timestamp')
        
class InsertUserData(generics.GenericAPIView):
    serializer_class = UserModelSerializer

    def Post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
# from .models import CustomUser
from django.contrib.auth.hashers import make_password

class RegisterView(APIView):
    def post(self, request):
        try:
            data = request.data
            user = User.objects.create(
                username=data['username'],
                password=make_password(data['password']), 
                phone_number=data['phone_number']
            )
            return Response({'message': 'User registered successfully!'}, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({'error': str(e)}, status=status.HTTP_400_BAD_REQUEST)

