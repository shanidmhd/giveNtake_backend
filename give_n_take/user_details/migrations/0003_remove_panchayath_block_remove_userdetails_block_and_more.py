# Generated by Django 4.0.6 on 2022-07-29 09:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('user_details', '0002_alter_block_code_alter_district_code_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='panchayath',
            name='block',
        ),
        migrations.RemoveField(
            model_name='userdetails',
            name='block',
        ),
        migrations.AddField(
            model_name='panchayath',
            name='District',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.CASCADE, to='user_details.district'),
        ),
        migrations.DeleteModel(
            name='Block',
        ),
    ]
