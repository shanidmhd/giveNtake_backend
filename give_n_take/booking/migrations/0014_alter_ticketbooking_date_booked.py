# Generated by Django 4.1.2 on 2023-01-17 11:57

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("booking", "0013_ticketbooking_date_booked"),
    ]

    operations = [
        migrations.AlterField(
            model_name="ticketbooking",
            name="date_booked",
            field=models.DateField(auto_now_add=True, null=True),
        ),
    ]