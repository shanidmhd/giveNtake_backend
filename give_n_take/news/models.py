from django.db import models


# Create your models here.
class NewsType(models.Model):

      name = models.CharField(max_length=255)

class News(models.Model):

      title = models.CharField(max_length=255)
      description = models.TextField()
      meeting_link = models.CharField(max_length=255)
      news_type = models.ForeignKey(NewsType,on_delete=models.CASCADE,default=None,null=True)
      news_image = models.ImageField(upload_to='news_images/', max_length=240, blank=True, null=True)
      date_added =  models.DateTimeField(blank=True, null=True)
      date_expired =  models.DateTimeField(blank=True, null=True)
      status = models.CharField(max_length=255)
      
