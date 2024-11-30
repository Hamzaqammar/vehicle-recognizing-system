from django.db import models

class vehicle(models.Model):
    GENDER_CHOICES = [
        ('Male', 'Male'),
        ('Female', 'Female'),
        ('Other', 'Other'),
    ]

    plate_num = models.CharField(max_length=15, unique=True)  # Number plate
    owner_name = models.CharField(max_length=100)
    owner_age = models.CharField(max_length=100)
    owner_cnic = models.CharField(max_length=100)
    owner_depart = models.CharField(max_length=100)
    owner_phone = models.CharField(max_length=100)
    owner_address = models.CharField(max_length=250 )
    owner_gender = models.CharField(max_length=10, choices=GENDER_CHOICES) 
    vehicle_Make = models.CharField(max_length=100)
    vehicle_Model = models.CharField(max_length=100)

    
    def __str__(self):
        return self.owner_name
