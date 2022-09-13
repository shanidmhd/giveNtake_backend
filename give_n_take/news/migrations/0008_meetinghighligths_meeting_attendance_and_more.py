# Generated by Django 4.0.6 on 2022-08-06 08:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('news', '0007_meetinghighligths_alter_news_description_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='meetinghighligths',
            name='meeting_attendance',
            field=models.IntegerField(blank=True, null=True),
        ),
        migrations.AlterField(
            model_name='meetingattendance',
            name='meeting_highligths',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='meeting_atendance', to='news.meetinghighligths'),
        ),
    ]