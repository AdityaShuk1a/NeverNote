from rest_framework import serializers

from .models import *

from django.contrib.auth.models import User


class UserModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = '__all__'
        
    def create(self, validated_data):
        return UserModel.objects.create(**validated_data)


class NotesModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = NotesModel
        fields = '__all__'
        
    def create(self, validated_data):
        return NotesModel.objects.create(**validated_data)
    

