from django.db import models
import uuid
from datetime import datetime
from django.core.validators import validate_email

# Create your models here.

def current_timestamp():
    return int(datetime.now().timestamp())

class UserModel(models.Model):
    
    user_name=models.CharField( max_length=50,primary_key=True, null=False)
    user_first_name=models.CharField( max_length=50, null=False)
    user_last_name=models.CharField( max_length=50, null=True)
    
    user_email = models.EmailField()
    user_phone_number=models.BigIntegerField(null=False)
    timestamp = models.BigIntegerField(default=current_timestamp, editable=False)
    user_password = models.CharField(max_length=56, default='default_password')
        
class NotesModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_name_pk = models.ForeignKey(UserModel, on_delete=models.CASCADE , related_name= 'notes')
    note_heading = models.CharField(max_length=255, blank=True)
    note_body= models.TextField(null=False)
    created_at_timestamp = models.BigIntegerField(default=current_timestamp, editable=False)
    updated_at_timestamp = models.BigIntegerField(default=current_timestamp, editable=True)
    
#no changes, just checking
