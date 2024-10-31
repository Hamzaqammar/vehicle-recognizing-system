from django.contrib import admin

# Register your models here.
from .models import vehicle

@admin.register(vehicle)
class VehicleAdmin(admin.ModelAdmin):
    list_display = ('plate_num', 'owner_name', 'owner_age')  # Fields to display in the list view
    search_fields = ('plate_num', 'owner_name')  # Add search functionality for plate_num and owner_name
    list_filter = ('owner_age',)  # Optional: filter by age or other fields

    # Define the fields to be displayed when creating or updating a vehicle entry
    fields = ('plate_num', 'owner_name', 'owner_age')