from django.db import models
import uuid
from datetime import datetime
from django.core.validators import validate_email
from django.contrib.auth.models import AbstractUser, Group, Permission

def current_timestamp():
    return int(datetime.now().timestamp())

class UserModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_name = models.CharField(max_length=50, null=False)
    user_email = models.EmailField(validators=[validate_email], unique=True)  # Ensure unique email
    user_phone_number = models.CharField(max_length=12, null=False)
    timestamp = models.BigIntegerField(default=current_timestamp, editable=False)
    user_password = models.CharField(max_length=56, default='default_password')

    def __str__(self):
        return self.user_name




# class CustomUser(models.Model):
#     id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
#     phone_number = models.CharField(max_length=10, blank=True, null=True)
#     # Overriding the related groups and permission
#     groups = models.ManyToManyField(
#         Group,
#         related_name='customuser_set',  
#         blank=True,
#         help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.'
#     )

#     user_permissions = models.ManyToManyField(
#         Permission,
#         related_name='customuser_set',  # Change this to a unique name
#         blank=True,
#         help_text='Specific permissions for this user.'
#     )


