from django.db import models
import uuid
# Create your models here.
class UserModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_name=models.CharField( max_length=50)
    user_email=models.EmailField(null=False)
    user_phone_number=models.BigIntegerField(null=False)