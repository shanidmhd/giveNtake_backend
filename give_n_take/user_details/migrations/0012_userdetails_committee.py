# Generated by Django 4.0.6 on 2022-08-25 04:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user_details', '0011_staffrole_json_sidebar'),
    ]

    operations = [
        migrations.AddField(
            model_name='userdetails',
            name='committee',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='user_details.committee'),
        ),
    ]
