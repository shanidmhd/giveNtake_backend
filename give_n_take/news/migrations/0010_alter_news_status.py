# Generated by Django 4.0.6 on 2022-08-27 07:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0009_news_region'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news',
            name='status',
            field=models.CharField(max_length=255, null=True),
        ),
    ]
