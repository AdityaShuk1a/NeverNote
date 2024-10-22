
from rest_framework import generics, status
from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly
from module.admin import *
from module.models import *
from module.serializers import *
from rest_framework.exceptions import NotFound
from rest_framework.response import Response

from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny 
from rest_framework.views import APIView

# Create your views here.

class UserDataList(generics.ListCreateAPIView):
    queryset = UserModel.objects.all().order_by('-timestamp')
    serializer_class = UserModelSerializer

class NotesModelList(generics.ListCreateAPIView):
    permission_classes = [AllowAny]
    queryset = NotesModel.objects.all().order_by('-updated_at_timestamp')
    serializer_class = NotesModelSerializer
          
class NoteUpdateDeleteView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [AllowAny]
    queryset = NotesModel.objects.all()  # Set the base queryset
    serializer_class = NotesModelSerializer
    # permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

class FetchGlobalNotes(generics.ListCreateAPIView):
    # first_query = UserModel.objects.all().annotate(
        
    # )
    queryset = NotesModel.objects.filter(post_note_global = True)
    serializer_class = NotesModelSerializer
        

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