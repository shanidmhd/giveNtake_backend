from django.db import models
from user_details.models import DatedModel,CreatedModel,CommitteeType


# Create your models here.
class NewsType(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)

class News(DatedModel,CreatedModel):

      title = models.CharField(max_length=255,null=True)
      description = models.TextField(null=True)
      meeting_link = models.CharField(max_length=255,null=True)
      news_type = models.ForeignKey(NewsType,on_delete=models.CASCADE,default=None,null=True)
      committe_type = models.ForeignKey(CommitteeType,on_delete=models.CASCADE,default=None,null=True)
      news_image = models.ImageField(upload_to='media/news_images/', max_length=240, blank=True, null=True)
      date_added =  models.DateTimeField(blank=True, null=True)
      date_expired =  models.DateTimeField(blank=True, null=True)
      status = models.CharField(max_length=255)

class MeetingHighligths(DatedModel,CreatedModel):

      meeting_minutes = models.TextField(null=True)
      description = models.TextField(null=True)
      meeting_attendance = models.IntegerField(blank=True, null=True)
      
class MeetingAttendance(models.Model):
    meeting_highligths = models.ForeignKey(MeetingHighligths,
                             related_name="meeting_atendance", on_delete=models.CASCADE)  
    attendance = models.ImageField(upload_to='media/attendance/%Y/%m/%d/',
                                null=True, blank=True)

class MeetingPhoto(models.Model):
    meeting_highligths = models.ForeignKey(MeetingHighligths,
                             related_name="meeting_photo", on_delete=models.CASCADE)  
    photo = models.ImageField(upload_to='media/photo/%Y/%m/%d/',
                                null=True, blank=True)
