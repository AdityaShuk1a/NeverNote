from django.shortcuts import render
from rest_framework import generics, serializers
from module.admin import *
from module.models import *
from module.serializers import *
# Create your views here.

class UserDataList(generics.ListCreateAPIView):
    queryset = UserModel.objects.all()
    serializer_class = UserModelSerializer

# def signup(request):
#     if request == ['POST']