from django.db import models
from user_details.models import DatedModel,CreatedModel,CommitteeType


# Create your models here.
class NewsType(DatedModel,CreatedModel):

      name = models.CharField(max_length=255)

class News(DatedModel,CreatedModel):

      title = models.CharField(max_length=255)
      description = models.TextField()
      meeting_link = models.CharField(max_length=255)
      news_type = models.ForeignKey(NewsType,on_delete=models.CASCADE,default=None,null=True)
      committe_type = models.ForeignKey(CommitteeType,on_delete=models.CASCADE,default=None,null=True)
      news_image = models.ImageField(upload_to='media/news_images/', max_length=240, blank=True, null=True)
      date_added =  models.DateTimeField(blank=True, null=True)
      date_expired =  models.DateTimeField(blank=True, null=True)
      status = models.CharField(max_length=255)
      
