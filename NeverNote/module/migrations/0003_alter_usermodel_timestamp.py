# Generated by Django 5.1.1 on 2024-10-01 18:17

import module.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('module', '0002_usermodel_timestamp_alter_usermodel_user_email'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usermodel',
            name='timestamp',
            field=models.BigIntegerField(default=module.models.current_timestamp),
        ),
        migrations.AddField(
            model_name='usermodel',
            name='user_password',
            field= models.CharField(max_length=25),
        ),
    ]
