from module.models import *
from module.serializers import *
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render 
from django.shortcuts import get_object_or_404
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token
from rest_framework import status
# from rest_framework.permissions import AllowAny
# from rest_framework_simplejwt.authentication import JWTAuthentication
# from rest_framework_simplejwt.tokens import RefreshToken
# from rest_framework.exceptions import NotAuthenticated
# from rest_framework.permissions import 

    
@api_view(['POST'])
def user_signup(request):
    serializer1=UserModelSerializer(data=request.data)
    if(serializer1.is_valid()):
        serializer1.save()
        user=User.objects.get(uname=request.data['user_name'])
        user.set_password(request.data['user_password'])
        user.save()
        niu_token=Token.objects.create(user=user)
        return Response({"token": niu_token.key , "user": serializer1.data})
    else:
        return Response(serializer1.errors ,status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def user_login(request):
    user = get_object_or_404(User, uname= request.data['user_name'])
    if not user.check_password(request.data['password']):
        return Response({"Detail":"Not found -_- "} ,status=status.HTTP_404_NOT_FOUND)
    niu_token,created =Token.objects.get_or_create(user=user)
    serializer1=UserModelSerializer(instance=user)
    return Response({"token": niu_token.key , "user": serializer1.data}, status=status.HTTP_200_OK)
    