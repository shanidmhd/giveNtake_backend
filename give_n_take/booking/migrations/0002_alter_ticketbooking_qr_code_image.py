# Generated by Django 4.1.2 on 2022-11-21 09:24

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='ticketbooking',
            name='qr_code_image',
            field=models.ImageField(null=True, upload_to='qrcode'),
        ),
    ]
