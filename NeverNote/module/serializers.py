from rest_framework import serializers

from .models import *

from django.contrib.auth.models import User


# class UserModelSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = UserModel
#         fields = '__all__'
        
# def create(self, validated_data):
#     return UserModel.objects.create(**validated_data)

# class UserSerializer(serializers.ModelSerializer):
#     password = serializers.CharField(write_only=True)
#     phone_number = serializers.CharField(max_length=15)

#     class Meta:
#         model = CustomUser 
#         fields = ('username', 'email', 'phone_number', 'password')

#     def create(self, validated_data):
#         user = CustomUser(
#             username=validated_data['username'],
#             email=validated_data['email'],
#             phone_number=validated_data['phone_number'],
#         )
#         user.set_password(validated_data['password'])
#         user.save()
#         return user