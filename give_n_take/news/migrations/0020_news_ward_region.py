# Generated by Django 4.1.2 on 2023-03-08 08:33

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("user_details", "0018_alter_userdetails_user_image"),
        ("news", "0019_news_national_committee"),
    ]

    operations = [
        migrations.AddField(
            model_name="news",
            name="ward_region",
            field=models.ForeignKey(
                default=None,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name="news_region",
                to="user_details.ward",
            ),
        ),
    ]
