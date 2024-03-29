# Generated by Django 4.1.2 on 2023-01-25 09:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("user_details", "0018_alter_userdetails_user_image"),
        ("news", "0014_alter_news_district_region"),
    ]

    operations = [
        migrations.AlterField(
            model_name="news",
            name="committe_type",
            field=models.ForeignKey(
                default=None,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="user_details.committeetype",
            ),
        ),
        migrations.AlterField(
            model_name="news",
            name="news_type",
            field=models.ForeignKey(
                default=None,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                to="news.newstype",
            ),
        ),
        migrations.AlterField(
            model_name="news",
            name="panchayath_region",
            field=models.ForeignKey(
                default=None,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name="news_region",
                to="user_details.panchayath",
            ),
        ),
        migrations.AlterField(
            model_name="news",
            name="state_region",
            field=models.ForeignKey(
                default=None,
                null=True,
                on_delete=django.db.models.deletion.SET_NULL,
                related_name="news_region",
                to="user_details.state",
            ),
        ),
    ]
