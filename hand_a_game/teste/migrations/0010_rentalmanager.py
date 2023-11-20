# Generated by Django 4.2.6 on 2023-11-17 18:47

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('teste', '0009_alter_platform_logo'),
    ]

    operations = [
        migrations.CreateModel(
            name='RentalManager',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('initialDate', models.DateField()),
                ('game', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teste.game')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='teste.user')),
            ],
        ),
    ]
