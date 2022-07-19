from unicodedata import name
from django.db import models
from django.contrib.auth.models import User

class State(models.Model):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255)

class District(models.Model):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      state = models.ForeignKey(State,on_delete=models.CASCADE,default=None,null=True)

class Block(models.Model):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      district = models.ForeignKey(District,on_delete=models.CASCADE,default=None,null=True)

class Panchayath(models.Model):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      block = models.ForeignKey(Block,on_delete=models.CASCADE,default=None,null=True)

class Ward(models.Model):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)
      panchayath = models.ForeignKey(Panchayath,on_delete=models.CASCADE,default=None,null=True)

class StaffRole(models.Model):

      name = models.CharField(max_length=255)
      code = models.CharField(max_length=255,null=True)

class UserDetails(User,models.Model):
    
      name = models.CharField(max_length=266)
      phone_number = models.CharField(max_length=20, unique=True, blank=True, null=True)
      joined_date =  models.DateTimeField(blank=True, null=True)
      staff_role = models.ForeignKey(Panchayath,on_delete=models.CASCADE,default=None,null=True,related_name="user_staff_role")
      state = models.ForeignKey(State,on_delete=models.CASCADE,default=None,null=True,related_name="user_state")
      district = models.ForeignKey(District,on_delete=models.CASCADE,default=None,null=True,related_name="user_dist")
      block = models.ForeignKey(Block,on_delete=models.CASCADE,default=None,null=True,related_name="user_block")
      panchayath = models.ForeignKey(Panchayath,on_delete=models.CASCADE,default=None,null=True,related_name="user_panchayath")
      ward = models.ForeignKey(Ward,on_delete=models.CASCADE,default=None,null=True)
      designation = models.CharField(max_length=255)
      bln_staff = models.BooleanField(null=True)





