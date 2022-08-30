from django.contrib import admin
from user_details.models import *
# Register your models here.

class UserDetailsAdmin(admin.ModelAdmin):
    list_display = ['id','username', 'full_name']
    
    def full_name(self, obj):
        return obj.first_name + ' ' + obj.last_name

admin.site.register(UserDetails, UserDetailsAdmin)