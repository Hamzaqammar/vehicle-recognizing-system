# Generated by Django 5.0.3 on 2024-10-26 13:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vehicle', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='VehicleOwner',
            new_name='vehicle',
        ),
        migrations.RenameField(
            model_name='vehicle',
            old_name='plate_number',
            new_name='plate_num',
        ),
    ]