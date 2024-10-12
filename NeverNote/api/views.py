
from rest_framework import generics, status
from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly
from module.admin import *
from module.models import *
from module.serializers import *
from rest_framework.exceptions import NotFound
from rest_framework.response import Response

from rest_framework.views import APIView

# Create your views here.

class UserDataList(generics.ListCreateAPIView):
    queryset = UserModel.objects.all().order_by('-timestamp')
    serializer_class = UserModelSerializer

class NotesModelList(generics.ListCreateAPIView):
    queryset = NotesModel.objects.all().order_by('-updated_at_timestamp')
    serializer_class = NotesModelSerializer
          
class NoteUpdateDeleteView(generics.RetrieveUpdateDestroyAPIView):
    
    queryset = NotesModel.objects.all()  # Set the base queryset
    serializer_class = NotesModelSerializer
    # permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

    