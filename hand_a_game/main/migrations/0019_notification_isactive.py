# Generated by Django 4.2.7 on 2023-12-11 17:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0018_remove_notification_user_notification_game_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='notification',
            name='isActive',
            field=models.BooleanField(default=True),
        ),
    ]