from django.db import models
from register.models import  admin_model
from user_details.models  import State,District
from user_details.models import UserDetails
# Create your models here.

class Program_model(models.Model):
    program_name = models.CharField(max_length=1024)
    fk_admin_id=models.ForeignKey(admin_model,null=True,on_delete=models.CASCADE,related_name='admin')
    date = models.DateField(auto_now=False, auto_now_add=False,null=True)
    start_time = models.TimeField(auto_now=False, auto_now_add=False,null=True)
    end_time = models.TimeField(auto_now=False, auto_now_add=False,null=True)
    venue = models.CharField(max_length=1024)
    address = models.TextField(null=True)
    contact_no = models.CharField(max_length=12,null=True)
    latitude =  models.FloatField(null=True)
    longitude = models.FloatField(null=True)
    fk_state = models.ForeignKey(State,on_delete=models.CASCADE,related_name='state',null=True)
    fk_district = models.ForeignKey(District,on_delete=models.CASCADE,related_name='district',null=True)
    food = models.TextField(null=True)
    agenda = models.TextField(null=True)
    inauguration_name =  models.CharField(max_length=1024,null=True)
    schedule = models.JSONField(null=True)
    time_slot= models.IntegerField(null=True)
    total_seats = models.IntegerField()
    available_seats = models.IntegerField(null=True)
    
    def __str__(self):
        return self.program_name
    

class TicketBooking(models.Model):
    fk_user_id=models.ForeignKey(UserDetails,on_delete=models.CASCADE,related_name='user',null=True)
    fk_program = models.ForeignKey(Program_model,on_delete=models.CASCADE,related_name='program',null=True)
    no_of_seats = models.IntegerField()
    payment_status=models.CharField(max_length=50,default='pending')
    payment_completed = models.BooleanField(default=False)
    qr_code_image =models.ImageField(upload_to='qrcode',null=True)
    
    
    
    
    