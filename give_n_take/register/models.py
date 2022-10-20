from django.db import models
from user_details.models import StaffRole,State,District,Panchayath, UserDetails,Ward,CommitteeType


# Create your models here.
class admin_model(models.Model):
    user_image = models.ImageField(upload_to='staff/')
    name=models.CharField(max_length=1024)
    phone_number = models.CharField(max_length=12)
    staff_role=models.ForeignKey(StaffRole,on_delete=models.CASCADE)
    committee_type=models.ForeignKey(CommitteeType,on_delete=models.CASCADE)
    state=models.ForeignKey(State,on_delete=models.CASCADE)
    district=models.ForeignKey(District,on_delete=models.CASCADE)
    panchayath=models.ForeignKey(Panchayath,on_delete=models.CASCADE)
    ward=models.ForeignKey(Ward,on_delete=models.CASCADE)
    username=models.CharField(max_length=1024,unique=True)
    login_token = models.CharField(max_length=50,default=0)
    user_id=models.ForeignKey(UserDetails,on_delete=models.CASCADE,null=True)
    created_by= models.PositiveBigIntegerField(null=True)
    updated_by= models.PositiveBigIntegerField(null=True)
    
    def __str__(self):
        return self.name
    