# Generated by Django 3.2.4 on 2023-12-11 18:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0019_notification_isactive'),
    ]

    operations = [
        migrations.AddField(
            model_name='notification',
            name='type',
            field=models.CharField(default='', max_length=10),
        ),
    ]
