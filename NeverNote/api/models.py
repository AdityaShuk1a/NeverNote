from django.db import models
from django.db import models
import uuid
from datetime import datetime
from django.core.validators import validate_email


def current_timestamp():
    return int(datetime.now().timestamp())

class UserModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user_name=models.CharField( max_length=50, null=False)
    user_email = models.EmailField(validators=[validate_email], null=False, unique=True)
    user_phone_number=models.BigIntegerField(null=False, unique=True)
    timestamp = models.BigIntegerField(default=current_timestamp, editable=False)
    user_password = models.CharField(max_length=25)
    
class NotesModel(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE , related_name= 'notes')
    note_heading = models.CharField(max_length=255, blank=True)
    note_body= models.TextField(null=False)
    created_at_timestamp = models.BigIntegerField(default=current_timestamp, editable=False)
    updated_at_timestamp = models.BigIntegerField(default=current_timestamp, editable=False)

    def save(self, *args, **kwargs):
        if not self.pk:
            self.created_at_timestamp = current_timestamp()
        self.updated_at_timestamp = current_timestamp()
        self.note_heading=self.note_body[:60]
        super(NotesModel, self).save(*args, **kwargs)
    class Meta:
        ordering= ['-updated_at_timestamp']

