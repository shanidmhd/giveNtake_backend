from rest_framework import serializers
from .models import *

class NewsTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = NewsType
        fields = ['id','name','created_by','modified_by','date_added','date_modified']
        

    def create(self,validated_data):
        news_type = NewsType.objects.create(**validated_data)
        return news_type
      

class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = ['id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified']
        

    def create(self,validated_data):
        news = News.objects.create(**validated_data)
        return news

class MeetingHighligthsSerializer(serializers.ModelSerializer):

    class Meta:
        model = MeetingHighligths
        fields = '__all__'

    def create(self, validated_data):
        attendances = self.context['attendance']
        photos = self.context['photo']
        meeting_highligths = MeetingHighligths.objects.create(**validated_data)
        for attendance in attendances:
            MeetingAttendance.objects.create(meeting_highligths=meeting_highligths,
                                         attendance=attendance)
        for photo in photos:
            MeetingPhoto.objects.create(meeting_highligths=meeting_highligths,
                                         photo=photo)
        
        return meeting_highligths

    
