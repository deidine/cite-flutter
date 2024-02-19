# Generated by Django 5.0.1 on 2024-01-27 21:55

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('staduim', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='SubStadium',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('substdName', models.CharField(max_length=100)),
                ('substdUrlPicture', models.URLField()),
                ('stdId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='staduim.stadium')),
            ],
        ),
    ]
