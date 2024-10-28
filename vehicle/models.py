# models.py
from django.db import models

class vehicle(models.Model):
    plate_num = models.CharField(max_length=15, unique=True)  # Number plate
    owner_name = models.CharField(max_length=100)  # Owner's name
    owner_age = models.CharField(max_length=100)  # Owner's age
    
    def __str__(self):
        return self.owner_name
