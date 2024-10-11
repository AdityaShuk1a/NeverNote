
# def signup(request):
#     if request == ['POST']

from django.shortcuts import render
from rest_framework import generics, serializers
from rest_framework.response import Response
from rest_framework import status
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
<<<<<<< HEAD
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
        return NotesModel.objects.filter(user_name_pk=pk).order_by('-updated_at_timestamp')        
=======
        return UserModel.objects.filter(id=pk).values('user_name', 'user_email', 'user_phone_number').order_by('-timestamp')

class UserDataLeo(generics.ListAPIView):
    serializer_class = UserModelSerializer
    def get_queryset(self):
        
        return UserModel.objects.filter(user_name = "Aditya").order_by('timestamp')
    
    

class InsertUserData(generics.GenericAPIView):
    serializer_class = UserModelSerializer

    def Post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
>>>>>>> b1144980cbdb1967608c346798922b59a7529f6d
