from django.contrib import admin
from .models import vehicle

@admin.register(vehicle)
class VehicleAdmin(admin.ModelAdmin):
    list_display = ('plate_num', 'owner_name', 'owner_age', 'owner_gender')  # Display gender in the list view
    search_fields = ('plate_num', 'owner_name', 'owner_cnic')  # Search by additional fields if needed
    list_filter = ('owner_age', 'owner_gender')  # Add a filter for gender and age in the admin panel

    # Define the fields to be displayed when creating or updating a vehicle entry
    fields = ('plate_num', 'owner_name', 'owner_age', 'owner_gender', 'owner_cnic', 'owner_depart', 
              'owner_phone', 'owner_address','vehicle_Make','vehicle_Model')
