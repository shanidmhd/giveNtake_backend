# Generated by Django 4.0.6 on 2022-07-18 10:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0002_remove_news_vchr_image_news_news_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='news',
            name='news_image',
            field=models.ImageField(blank=True, max_length=240, null=True, upload_to='news_images/'),
        ),
    ]