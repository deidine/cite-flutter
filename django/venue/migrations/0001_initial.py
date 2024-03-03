# Generated by Django 5.0.1 on 2024-03-03 20:20

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('employees', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Venue',
            fields=[
                ('venueId', models.AutoField(primary_key=True, serialize=False)),
                ('venueName', models.CharField(max_length=100)),
                ('pricePerHour', models.IntegerField()),
                ('location', models.CharField(max_length=200)),
                ('category', models.CharField(max_length=100)),
                ('rating', models.DecimalField(decimal_places=1, max_digits=3)),
                ('image', models.ImageField(upload_to='venue_images/')),
                ('status', models.CharField(choices=[('valid', 'Valid'), ('invalid', 'Invalid')], max_length=23)),
                ('userId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employees.employeelist')),
            ],
        ),
    ]
