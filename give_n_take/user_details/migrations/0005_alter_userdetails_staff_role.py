# Generated by Django 4.0.6 on 2022-07-29 12:23

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user_details', '0004_rename_district_panchayath_district'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userdetails',
            name='staff_role',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='user_staff_role', to='user_details.staffrole'),
        ),
    ]
