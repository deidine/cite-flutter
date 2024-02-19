# Generated by Django 5.0.1 on 2024-02-19 16:03

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('booking', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Venue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('venueName', models.CharField(max_length=100)),
                ('pricePerHour', models.IntegerField()),
                ('location', models.CharField(max_length=200)),
                ('category', models.CharField(max_length=100)),
                ('rating', models.DecimalField(decimal_places=1, max_digits=3)),
                ('image', models.ImageField(upload_to='venue_images/')),
                ('venueId', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='booking.booking')),
            ],
        ),
    ]
