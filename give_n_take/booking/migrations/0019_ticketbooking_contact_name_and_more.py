# Generated by Django 4.1.2 on 2023-04-30 17:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0018_program_model_fk_panchayath_program_model_fk_ward'),
    ]

    operations = [
        migrations.AddField(
            model_name='ticketbooking',
            name='contact_name',
            field=models.CharField(max_length=150, null=True),
        ),
        migrations.AddField(
            model_name='ticketbooking',
            name='contact_phone_number',
            field=models.CharField(max_length=16, null=True),
        ),
    ]
