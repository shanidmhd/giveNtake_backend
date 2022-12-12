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
from register.models import admin_model


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
    permission_classes=[IsAuthenticated]

    def retrieve(self, request,*args, **kargs):
        news_id = kargs.get('pk')
        if news_id:
            try:
                appts = News.objects.get(id=int(news_id))
                serializer = self.get_serializer(appts, many=False)
                return Response({'results':serializer.data})
            except:
                return Response({'message': 'No data found'})
    def list(self,request):
       
      
        district_news = News.objects.filter(district_region=(UserDetails.objects.get(id=request.user.id).district)).values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','district_region__id','district_region__name').order_by('-date_added')
        state_news = News.objects.filter(state_region=(UserDetails.objects.get(id=request.user.id).state)).values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','state_region__id','state_region__name').order_by('-date_added')
        panchayath_news = News.objects.filter(panchayath_region=(UserDetails.objects.get(id=request.user.id).panchayath)).values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified','panchayath_region__id','panchayath_region__name').order_by('-date_added')
        all_news = News.objects.filter(show_all=True).values('id','title','description','meeting_link','news_type','committe_type','news_image','date_added','date_expired','status','created_by','modified_by','date_modified').order_by('-date_added')
            # serializer = self.get_serializer(appts, many=True)
        response={
        'district' : district_news,
        'panchayath' : panchayath_news,
        'state' : state_news,
        'all':all_news
        }
    
            
        return Response({'results':response})
        

    def create(self, request, *args, **kwargs): 
            serializer = self.serializer_class(data=request.data)
            admin = (
                admin_model.objects.filter(user_id__id=request.user.id)
                .values("committee_type__name", "state", "district","panchayath")
                .first()
            )
            # fk_admin_id = admin_model.objects.get(user_id__id=request.user.id)

            # Checking the committee type of the admin and then it is saving the program accordingly.

            if admin["committee_type__name"] == "State Committee":
            
                if serializer.is_valid():
                    serializer.save(
                        state_region=State.objects.get(id=admin["state"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            elif admin["committee_type__name"] == "District Committee":
            
                if serializer.is_valid():
                    serializer.save(
                        district_region=District.objects.get(id=admin["district"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
                
            elif admin["committee_type__name"] == "Panchayath Committee":
            
                if serializer.is_valid():
                    serializer.save(
                        panchayath_region=Panchayath.objects.get(id=admin["panchayath"]),created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "News succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
            else:
            
                if serializer.is_valid():
                    serializer.save(
                        show_all=True,created_by=UserDetails.objects.get(id=request.user.id)
                    )
                    return Response(
                        {"success": "Program succesfully added"},
                        status=status.HTTP_201_CREATED,
                    )

                return Response(
                    {"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST
                )
      
class get_news_by_user(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            news =News.objects.filter(created_by_id=request.user.id).values()
            for item in news:
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':"Failed to get user news"})

class get_news_by_user_region(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            user_details=UserDetails.objects.get(id=request.user.id)
            news =News.objects.filter(district_region=user_details.district.id).values()
            for item in news:
                item['news_image']=settings.HOST_ADDRESS + settings.MEDIA_URL +item['news_image']
            return Response({'results':news})
        except Exception as e:
            return Response({'results':"Failed to get user region"})

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
            "created_by": request.user.id
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
                    # for attendance in attendances:
                    MeetingAttendance.objects.create(meeting_highligths_id=meeting_highligths['id'],attendance=attendances)
                if photos:
                    MeetingPhoto.objects.filter(meeting_highligths_id = meeting_highligths['id']).delete()
                    # for photo in photos:
                    MeetingPhoto.objects.create(meeting_highligths_id=meeting_highligths['id'],photo=photos)
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


class get_meeting_by_user(APIView): 
    queryset = News.objects.all()
    permission_classes = [AllowAny]
    @swagger_auto_schema(
        operation_description="User",
        manual_parameters=[openapi.Parameter(
            'username', 
            openapi.IN_QUERY, 
            type=openapi.TYPE_STRING
            )],
    )
    def get(self,request):
        try:
            appts = MeetingHighligths.objects.filter(created_by_id=request.user.id).values()
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
        except Exception as e:
            return Response({'results':"Failed to get user meetings"})

