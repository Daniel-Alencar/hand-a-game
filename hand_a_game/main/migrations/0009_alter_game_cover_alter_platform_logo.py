# Generated by Django 4.2.6 on 2023-11-28 14:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_alter_user_phone'),
    ]

    operations = [
        migrations.AlterField(
            model_name='game',
            name='cover',
            field=models.ImageField(upload_to='images/games/'),
        ),
        migrations.AlterField(
            model_name='platform',
            name='logo',
            field=models.ImageField(upload_to='images/platforms/'),
        ),
    ]