from rest_framework import serializers
from .models import *
from django.conf import settings
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
        fields = ['id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','district_region','state_region','panchayath_region']
        
    def to_representation(self, instance):
        rep= super().to_representation(instance)
        if rep['news_image']:
            rep['news_image']=settings.HOST_ADDRESS+rep['news_image']
        return rep
        

    def create(self,validated_data):
        news = News.objects.create(**validated_data)
        return news

    def update(self, instance, validated_data):
        super().update(instance=instance, validated_data=validated_data)
        if getattr(validated_data.get('committe_type'), 'id') == 4:
            instance.state_region = validated_data.get('state_region')
            instance.district_region = None
            instance.panchayath_region = None
            instance.ward_region = None
        elif getattr(validated_data.get('committe_type'), 'id') == 5:
            instance.state_region = None
            instance.district_region = validated_data.get('district_region')
            instance.panchayath_region = None
            instance.ward_region = None
        elif getattr(validated_data.get('committe_type'), 'id') == 6:
            instance.state_region = None
            instance.district_region = None
            instance.panchayath_region = validated_data.get('panchayath_region')
            instance.ward_region = None
        elif getattr(validated_data.get('committe_type'), 'id') == 7:
            instance.state_region = None
            instance.district_region = None
            instance.panchayath_region = None
            instance.ward_region = validated_data.get('ward_region')
        else:
            instance.state_region = None
            instance.district_region = None
            instance.panchayath_region = None
            instance.ward_region = None
        instance.save()
        return instance

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

    
