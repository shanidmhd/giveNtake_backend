import code
import json
from optparse import Values
import sys
import requests
from django.shortcuts import render
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework import viewsets
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework import status
from .models import *
from datetime import datetime
from .serializers import *
from django.conf import settings



class NewsTypeViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    serializer_class = NewsTypeSerializer
    queryset = NewsType.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        news_type_id = kargs.get('pk')
        if news_type_id:
            try:
                appts = NewsType.objects.get(id=int(news_type_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = NewsType.objects.all()
            serializer = self.get_serializer(appts, many=True)
            return Response({'results':serializer.data})

class NewsViewSet(viewsets.ModelViewSet):
    """
    A viewset for register and edit user instances.
    """
    parser_classes = [MultiPartParser, FormParser]
    serializer_class = NewsSerializer
    queryset = News.objects.all()
    http_method_names = ['get', 'post', 'put' , 'delete']

    def retrieve(self, request,*args, **kargs):
        news_id = kargs.get('pk')
        if news_id:
            try:
                appts = News.objects.get(id=int(news_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
        else:
            try:
                appts = News.objects.all()
                serializer = self.get_serializer(appts, many=True)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})

class MeetingHighligthsViewSet(viewsets.ModelViewSet):
    queryset = MeetingHighligths.objects.all()
    serializer_class = MeetingHighligthsSerializer
    http_method_names = ['post','get','delete','put']

    def create(self, request, *args, **kwargs):
        attendance = request.FILES.getlist('attendance', None)
        photo = request.FILES.getlist('photo', None)
        data = {
            "meeting_minutes": request.POST.get('meeting_minutes', None),
            "description": request.POST.get('description', None),
            "meeting_attendance": request.POST.get('meeting_attendance', None),
            }
        _serializer = self.serializer_class(data=data, context={'attendance': attendance,'photo':photo})
        if _serializer.is_valid():
            _serializer.save()
            return Response(data=_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(data=_serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    # @swagger_auto_schema(
    #     operation_description="meeting minutes list",
    #     manual_parameters=[openapi.Parameter(
    #         'district_id', 
    #         openapi.IN_QUERY, 
    #         type=openapi.TYPE_STRING
    #         )],
    # )

    def list(self, request):
        appts = MeetingHighligths.objects.values()
        for meeting_highligths in appts:
            lst_attendance = []
            lst_photo = []
            attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
            for att in attendance:
                att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                lst_attendance.append(att)
            photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
            for att in photo:
                att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                lst_photo.append(att)
            meeting_highligths['attendance']=lst_attendance
            meeting_highligths['photo']=lst_photo
        return Response({'results':appts})
    
    def retrieve(self, request,*args, **kargs):
        meeting_highligths_id = kargs.get('pk')
        if meeting_highligths_id:
            try:
                lst_attendance = []
                lst_photo = []
                meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
                return Response({'results':meeting_highligths})
            except:
                return Response({'message': 'No data found'})
            
        else:
            appts = MeetingHighligths.objects.values()
            for meeting_highligths in appts:
                lst_attendance = []
                lst_photo = []
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
            return Response({'results':appts})

    def update(self, request,*args, **kargs):
        meeting_minutes = request.data.get('meeting_minutes')
        description = request.data.get('description')
        meeting_attendance = request.data.get('meeting_attendance')
        attendances = request.data.get('attendance')
        photos = request.data.get('photo')
        meeting_highligths_id = kargs.get('pk')
        if meeting_highligths_id:
            try:
                meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
                if not meeting_minutes:
                    meeting_minutes =  meeting_highligths['meeting_minutes']
                if not description:
                    description = meeting_highligths['description']
                if not meeting_attendance:
                    meeting_attendance = meeting_attendance['meeting_attendance']
                MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).update(meeting_minutes=meeting_minutes,description=description,meeting_attendance=meeting_attendance)
                if attendances:
                    MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
                    for attendance in attendances:
                        MeetingAttendance.objects.create(meeting_highligths_id=meeting_highligths['id'],attendance=attendance)
                if photos:
                    MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
                    for photo in photos:
                        MeetingPhoto.objects.create(meeting_highligths_id=meeting_highligths['id'],photo=photo)
                meeting_highligths = MeetingHighligths.objects.filter(id=int(meeting_highligths_id)).values().first()
                lst_attendance = []
                lst_photo = []
                attendance = MeetingAttendance.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('attendance',flat=True)
                for att in attendance:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_attendance.append(att)
                photo = MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).values_list('photo',flat=True)
                for att in photo:
                    att = settings.HOST_ADDRESS + settings.MEDIA_URL + att
                    lst_photo.append(att)
                meeting_highligths['attendance']=lst_attendance
                meeting_highligths['photo']=lst_photo
                return Response({'results':meeting_highligths})
            except:
                return Response({'message': 'No data found'})




