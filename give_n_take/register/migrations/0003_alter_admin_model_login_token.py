# Generated by Django 4.1.2 on 2022-10-18 11:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('register', '0002_admin_model_login_token'),
    ]

    operations = [
        migrations.AlterField(
            model_name='admin_model',
            name='login_token',
            field=models.CharField(default=0, max_length=50),
        ),
    ]