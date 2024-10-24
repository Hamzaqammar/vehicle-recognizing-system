# models.py
from django.db import models

class VehicleOwner(models.Model):
    plate_number = models.CharField(max_length=15, unique=True)  # Number plate
    owner_name = models.CharField(max_length=100)  # Owner's name

    def __str__(self):
        return self.owner_name
