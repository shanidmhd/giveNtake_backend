# Generated by Django 4.1.2 on 2023-03-08 06:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ("news", "0017_meetinghighligths_show_all"),
    ]

    operations = [
        migrations.AddField(
            model_name="meetinghighligths",
            name="national_committee",
            field=models.BooleanField(default=False),
        ),
    ]
