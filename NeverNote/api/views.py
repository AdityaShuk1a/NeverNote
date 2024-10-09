
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