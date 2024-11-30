# Generated by Django 5.0.3 on 2024-11-30 13:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('vehicle', '0003_vehicle_owner_address_vehicle_owner_age_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_Make',
            field=models.CharField(default='xyz', max_length=100),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='vehicle',
            name='vehicle_Model',
            field=models.CharField(default='xyz', max_length=100),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='vehicle',
            name='owner_address',
            field=models.CharField(max_length=250),
        ),
        migrations.AlterField(
            model_name='vehicle',
            name='owner_cnic',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='vehicle',
            name='owner_depart',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='vehicle',
            name='owner_phone',
            field=models.CharField(max_length=100),
        ),
    ]