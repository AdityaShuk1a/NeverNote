from rest_framework import serializers

from .models import *

class UserModelSerializer(serializers.ModelSerializer):
    class meta:
        model = UserModel
        Fields = '__all__'
        
def create(self, validated_data):
    return UserModel.objects.create(**validated_data)