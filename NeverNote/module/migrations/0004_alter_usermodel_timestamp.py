# Generated by Django 5.1.1 on 2024-10-02 10:07

import module.models
from django.db import migrations, models
from django.core.validators import validate_email


class Migration(migrations.Migration):

    dependencies = [
        ('module', '0003_alter_usermodel_timestamp'),
    ]

    operations = [
        migrations.AddField(
            model_name='usermodel',
            name='timestamp',
            field=models.BigIntegerField(default=module.models.current_timestamp, editable=False),
        ),
        migrations.AddField(
            model_name='usermodel',
            name='user_name',
            field= models.CharField( max_length=50, null=False),
        ),
        migrations.AddField(
            model_name='usermodel',
            name='user_email',
            field= models.EmailField(validators=[validate_email], null=False),
        ),
        migrations.AddField(
            model_name='usermodel',
            name='user_phone_number',
            field= models.BigIntegerField(null=False),
        ),
    ]
