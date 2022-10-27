from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user_details', '0016_alter_bloodgroup_date_added_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='userdetails',
            name='is_admin',
            field=models.BooleanField(default=False, null=True),
        ),
    ]
