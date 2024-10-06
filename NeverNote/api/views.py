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
        return UserModel.objects.filter(id=pk).order_by('-timestamp')
        

# def signup(request):
#     if request == ['POST']