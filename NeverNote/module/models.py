from django.db import models
import uuid
from datetime import datetime
from django.core.validators import validate_email

# Create your models here.

def current_timestamp():
    return int(datetime.now().timestamp())

class UserModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_name=models.CharField( max_length=50, null=False)
    user_email = models.EmailField()
    user_phone_number=models.BigIntegerField(null=False)
    timestamp = models.BigIntegerField(default=current_timestamp, editable=False)
<<<<<<< HEAD
    user_password = models.CharField(max_length=25)
    
    
    
#no changes, just checking

=======
    user_password = models.CharField(max_length=56, default='default_password')
        
    
    
#no changes, just checking
>>>>>>> main
