from unicodedata import name
from django.db import models
from django.contrib.auth.models import User

class DatedModel(models.Model):

     class Meta:
         abstract = True
 
     date_added = models.DateTimeField(auto_now_add=True,null=True)
     date_modified = models.DateTimeField(auto_now=True,null=True) 
 
class CreatedModel(models.Model):

     """
     Models that inherit this model should explicitly write functionality to
     update the created and modified since you do not have access to the
     request context inside models
     """
 
     class Meta:
         abstract = True
 
     created_by = models.ForeignKey(
         User,null=True, on_delete=models.SET_NULL, related_name="%(app_label)s_%(class)s_created")
     modified_by = models.ForeignKey(
         User, on_delete=models.SET_NULL, blank=True, null=True,
         related_name="%(app_label)s_%(class)s_modified")

class State(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255)


      def __str__(self):
          return self.name
      
class District(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      state = models.ForeignKey(State,on_delete=models.CASCADE,default=None,null=True)

      
      def __str__(self):
          return self.name
# class Block(DatedModel,CreatedModel):

#       name = models.CharField(max_length=255)
#       code = models.CharField(max_length=255,null=True)
#       district = models.ForeignKey(District,on_delete=models.CASCADE,default=None,null=True)

class Panchayath(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      district = models.ForeignKey(District,on_delete=models.CASCADE,default=None,null=True)
      
      def __str__(self):
          return self.name
class Ward(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      panchayath = models.ForeignKey(Panchayath,on_delete=models.CASCADE,default=None,null=True)
      def __str__(self):
          return self.name
class StaffRole(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      json_sidebar = models.JSONField(blank=True, null=True)
      
      def __str__(self):
          return self.name

class CommitteeType(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      
      def __str__(self):
          return self.name

class Committee(DatedModel,CreatedModel):

      name = models.CharField(max_length=266)
      phone_number = models.CharField(max_length=20, blank=True, null=True)
      staff_role = models.ForeignKey(StaffRole,on_delete=models.CASCADE,default=None,null=True,related_name="committee_staff_role")
      committee_type = models.ForeignKey(CommitteeType,on_delete=models.CASCADE,default=None,null=True,related_name="committee_type")

      def __str__(self):
          return self.name
class BloodGroup(DatedModel,CreatedModel):

      name = models.CharField(max_length=266)

class UserDetails(User,DatedModel,CreatedModel):
    
      name = models.CharField(max_length=266)
      phone_number = models.CharField(max_length=20, blank=True, null=True)
      joined_date =  models.DateTimeField(blank=True, null=True)
      staff_role = models.ForeignKey(StaffRole,on_delete=models.CASCADE,default=None,null=True,related_name="user_staff_role")
      state = models.ForeignKey(State,on_delete=models.CASCADE,default=None,null=True,related_name="user_state")
      district = models.ForeignKey(District,on_delete=models.CASCADE,default=None,null=True,related_name="user_dist")
      panchayath = models.ForeignKey(Panchayath,on_delete=models.CASCADE,default=None,null=True,related_name="user_panchayath")
      ward = models.ForeignKey(Ward,on_delete=models.CASCADE,default=None,null=True)
      designation = models.CharField(max_length=255,null=True)
      bln_staff = models.BooleanField(null=True,default=False)
      committee_type = models.ForeignKey(CommitteeType,on_delete=models.CASCADE,default=None,null=True)
      pin_code = models.CharField(max_length=255,null=True)
      address = models.TextField(null=True)
      blood_group = models.CharField(max_length=50,null=True)
      str_panchayath = models.CharField(max_length=255,null=True) 
      str_ward = models.CharField(max_length=255,null=True) 
      is_details = models.BooleanField(null=True)
      user_image = models.ImageField(upload_to='media/user_images/', max_length=240, blank=True, null=True)
      is_admin=models.BooleanField(default=False)





